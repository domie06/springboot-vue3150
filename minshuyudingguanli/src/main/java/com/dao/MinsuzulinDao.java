package com.dao;

import com.entity.MinsuzulinEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.view.MinsuzulinView;

/**
 * 民宿租赁 Dao 接口
 *
 * @author 
 */
public interface MinsuzulinDao extends BaseMapper<MinsuzulinEntity> {

   List<MinsuzulinView> selectListView(Pagination page,@Param("params")Map<String,Object> params);

}
