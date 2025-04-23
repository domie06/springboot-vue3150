package com.entity.model;

import com.entity.MinsuEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import java.io.Serializable;


/**
 * 民宿信息
 * 接收传参的实体类
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了）
 * 取自ModelAndView 的model名称
 */
public class MinsuModel implements Serializable {
    private static final long serialVersionUID = 1L;




    /**
     * 主键
     */
    private Integer id;


    /**
     * 民宿名称
     */
    private String minsuName;


    /**
     * 房屋类型
     */
    private Integer fagwuTypes;


    /**
     * 价格/天
     */
    private Double minsuNewMoney;


    /**
     * 房屋图片
     */
    private String minsuPhoto;


    /**
     * 地址
     */
    private String minsuAddress;


    /**
     * 房屋状态
     */
    private Integer fwstateTypes;


    /**
     * 所属房东
     */
    private Integer fangdongId;


    /**
     * 具体信息
     */
    private String minsuContent;


    /**
     * 创建时间 show1 show2 photoShow
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    private Date createTime;


    /**
	 * 获取：主键
	 */
    public Integer getId() {
        return id;
    }


    /**
	 * 设置：主键
	 */
    public void setId(Integer id) {
        this.id = id;
    }
    /**
	 * 获取：民宿名称
	 */
    public String getMinsuName() {
        return minsuName;
    }


    /**
	 * 设置：民宿名称
	 */
    public void setMinsuName(String minsuName) {
        this.minsuName = minsuName;
    }
    /**
	 * 获取：房屋类型
	 */
    public Integer getFagwuTypes() {
        return fagwuTypes;
    }


    /**
	 * 设置：房屋类型
	 */
    public void setFagwuTypes(Integer fagwuTypes) {
        this.fagwuTypes = fagwuTypes;
    }
    /**
	 * 获取：价格/天
	 */
    public Double getMinsuNewMoney() {
        return minsuNewMoney;
    }


    /**
	 * 设置：价格/天
	 */
    public void setMinsuNewMoney(Double minsuNewMoney) {
        this.minsuNewMoney = minsuNewMoney;
    }
    /**
	 * 获取：房屋图片
	 */
    public String getMinsuPhoto() {
        return minsuPhoto;
    }


    /**
	 * 设置：房屋图片
	 */
    public void setMinsuPhoto(String minsuPhoto) {
        this.minsuPhoto = minsuPhoto;
    }
    /**
	 * 获取：地址
	 */
    public String getMinsuAddress() {
        return minsuAddress;
    }


    /**
	 * 设置：地址
	 */
    public void setMinsuAddress(String minsuAddress) {
        this.minsuAddress = minsuAddress;
    }
    /**
	 * 获取：房屋状态
	 */
    public Integer getFwstateTypes() {
        return fwstateTypes;
    }


    /**
	 * 设置：房屋状态
	 */
    public void setFwstateTypes(Integer fwstateTypes) {
        this.fwstateTypes = fwstateTypes;
    }
    /**
	 * 获取：所属房东
	 */
    public Integer getFangdongId() {
        return fangdongId;
    }


    /**
	 * 设置：所属房东
	 */
    public void setFangdongId(Integer fangdongId) {
        this.fangdongId = fangdongId;
    }
    /**
	 * 获取：具体信息
	 */
    public String getMinsuContent() {
        return minsuContent;
    }


    /**
	 * 设置：具体信息
	 */
    public void setMinsuContent(String minsuContent) {
        this.minsuContent = minsuContent;
    }
    /**
	 * 获取：创建时间 show1 show2 photoShow
	 */
    public Date getCreateTime() {
        return createTime;
    }


    /**
	 * 设置：创建时间 show1 show2 photoShow
	 */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    }
