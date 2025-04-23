package com.thread;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.entity.MinsuEntity;
import com.entity.MinsuzulinEntity;
import com.service.DictionaryService;
import com.service.MinsuService;
import com.service.MinsuzulinService;
import com.utils.SpringContextUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContextEvent;
import java.util.*;

/**
 * 线程执行方法（做一些项目启动后 一直要执行的操作，比如根据时间自动更改订单状态，比如订单签收30天自动收货功能，比如根据时间来更改状态）
 */
public class MyThreadMethod extends Thread  {


    private MinsuService minsuService;
    public MinsuService getMinsuService() {
        return minsuService;
    }
    public void setMinsuService(MinsuService minsuService) {
        this.minsuService = minsuService;
    }

    private MinsuzulinService minsuzulinService;
    public MinsuzulinService getMinsuzulinService() {
        return minsuzulinService;
    }
    public void setMinsuzulinService(MinsuzulinService minsuzulinService) {
        this.minsuzulinService = minsuzulinService;
    }



    public void run() {
        while (!this.isInterrupted()) {// 线程未中断执行循环
            try {

                Thread.sleep(5000); //每隔5000ms执行一次

            } catch (InterruptedException e) {
                e.printStackTrace();
            }

            Wrapper<MinsuEntity> minsuEntityEntity = new EntityWrapper<MinsuEntity>()
                    .eq("fwstate_types",1);
            List<MinsuEntity> minsuEntities = minsuService.selectList(minsuEntityEntity);
            if(minsuEntities.size()> 0){
                List<Integer> joinIds = new ArrayList<>();
                for (MinsuEntity minsuEntities1:minsuEntities) {
                    joinIds.add(minsuEntities1.getId());
                }
                Wrapper<MinsuzulinEntity> minsuzulinEntityEntity = new EntityWrapper<MinsuzulinEntity>()
                        .in("minsu_id",joinIds)
                        .lt("tuifang_time",new Date());
                List<MinsuzulinEntity> minsuzulinEntities = minsuzulinService.selectList(minsuzulinEntityEntity);

                ArrayList<MinsuEntity> minsuEntities1 = new ArrayList<>();
                for (MinsuzulinEntity zulin:minsuzulinEntities) {
                    MinsuEntity minsuEntity = new MinsuEntity();
                    minsuEntity.setId(zulin.getMinsuId());
                    minsuEntity.setFwstateTypes(2);
                    minsuEntities1.add(minsuEntity);
                }
                    minsuService.updateBatchById(minsuEntities1);

            }

        }
    }
}
