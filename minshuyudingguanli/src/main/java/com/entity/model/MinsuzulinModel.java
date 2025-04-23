package com.entity.model;

import com.entity.MinsuzulinEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import java.io.Serializable;


/**
 * 民宿租赁
 * 接收传参的实体类
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了）
 * 取自ModelAndView 的model名称
 */
public class MinsuzulinModel implements Serializable {
    private static final long serialVersionUID = 1L;




    /**
     * 主键
     */
    private Integer id;


    /**
     * 民宿
     */
    private Integer minsuId;


    /**
     * 租赁用户
     */
    private Integer yonghuId;


    /**
     * 入住时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    private Date ruzhuTime;


    /**
     * 退房时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    private Date tuifangTime;


    /**
     * 创建时间
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
	 * 获取：民宿
	 */
    public Integer getMinsuId() {
        return minsuId;
    }


    /**
	 * 设置：民宿
	 */
    public void setMinsuId(Integer minsuId) {
        this.minsuId = minsuId;
    }
    /**
	 * 获取：租赁用户
	 */
    public Integer getYonghuId() {
        return yonghuId;
    }


    /**
	 * 设置：租赁用户
	 */
    public void setYonghuId(Integer yonghuId) {
        this.yonghuId = yonghuId;
    }
    /**
	 * 获取：入住时间
	 */
    public Date getRuzhuTime() {
        return ruzhuTime;
    }


    /**
	 * 设置：入住时间
	 */
    public void setRuzhuTime(Date ruzhuTime) {
        this.ruzhuTime = ruzhuTime;
    }
    /**
	 * 获取：退房时间
	 */
    public Date getTuifangTime() {
        return tuifangTime;
    }


    /**
	 * 设置：退房时间
	 */
    public void setTuifangTime(Date tuifangTime) {
        this.tuifangTime = tuifangTime;
    }
    /**
	 * 获取：创建时间
	 */
    public Date getCreateTime() {
        return createTime;
    }


    /**
	 * 设置：创建时间
	 */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    }
