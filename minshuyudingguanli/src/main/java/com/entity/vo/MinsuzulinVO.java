package com.entity.vo;

import com.entity.MinsuzulinEntity;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;

/**
 * 民宿租赁
 * 手机端接口返回实体辅助类
 * （主要作用去除一些不必要的字段）
 */
@TableName("minsuzulin")
public class MinsuzulinVO implements Serializable {
    private static final long serialVersionUID = 1L;


    /**
     * 主键
     */

    @TableField(value = "id")
    private Integer id;


    /**
     * 民宿
     */

    @TableField(value = "minsu_id")
    private Integer minsuId;


    /**
     * 租赁用户
     */

    @TableField(value = "yonghu_id")
    private Integer yonghuId;


    /**
     * 入住时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat

    @TableField(value = "ruzhu_time")
    private Date ruzhuTime;


    /**
     * 退房时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat

    @TableField(value = "tuifang_time")
    private Date tuifangTime;


    /**
     * 创建时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat

    @TableField(value = "create_time")
    private Date createTime;


    /**
	 * 设置：主键
	 */
    public Integer getId() {
        return id;
    }


    /**
	 * 获取：主键
	 */

    public void setId(Integer id) {
        this.id = id;
    }
    /**
	 * 设置：民宿
	 */
    public Integer getMinsuId() {
        return minsuId;
    }


    /**
	 * 获取：民宿
	 */

    public void setMinsuId(Integer minsuId) {
        this.minsuId = minsuId;
    }
    /**
	 * 设置：租赁用户
	 */
    public Integer getYonghuId() {
        return yonghuId;
    }


    /**
	 * 获取：租赁用户
	 */

    public void setYonghuId(Integer yonghuId) {
        this.yonghuId = yonghuId;
    }
    /**
	 * 设置：入住时间
	 */
    public Date getRuzhuTime() {
        return ruzhuTime;
    }


    /**
	 * 获取：入住时间
	 */

    public void setRuzhuTime(Date ruzhuTime) {
        this.ruzhuTime = ruzhuTime;
    }
    /**
	 * 设置：退房时间
	 */
    public Date getTuifangTime() {
        return tuifangTime;
    }


    /**
	 * 获取：退房时间
	 */

    public void setTuifangTime(Date tuifangTime) {
        this.tuifangTime = tuifangTime;
    }
    /**
	 * 设置：创建时间
	 */
    public Date getCreateTime() {
        return createTime;
    }


    /**
	 * 获取：创建时间
	 */

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

}
