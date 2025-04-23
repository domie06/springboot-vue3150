package com.entity.vo;

import com.entity.MinsuEntity;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;

/**
 * 民宿信息
 * 手机端接口返回实体辅助类
 * （主要作用去除一些不必要的字段）
 */
@TableName("minsu")
public class MinsuVO implements Serializable {
    private static final long serialVersionUID = 1L;


    /**
     * 主键
     */

    @TableField(value = "id")
    private Integer id;


    /**
     * 民宿名称
     */

    @TableField(value = "minsu_name")
    private String minsuName;


    /**
     * 房屋类型
     */

    @TableField(value = "fagwu_types")
    private Integer fagwuTypes;


    /**
     * 价格/天
     */

    @TableField(value = "minsu_new_money")
    private Double minsuNewMoney;


    /**
     * 房屋图片
     */

    @TableField(value = "minsu_photo")
    private String minsuPhoto;


    /**
     * 地址
     */

    @TableField(value = "minsu_address")
    private String minsuAddress;


    /**
     * 房屋状态
     */

    @TableField(value = "fwstate_types")
    private Integer fwstateTypes;


    /**
     * 所属房东
     */

    @TableField(value = "fangdong_id")
    private Integer fangdongId;


    /**
     * 具体信息
     */

    @TableField(value = "minsu_content")
    private String minsuContent;


    /**
     * 创建时间 show1 show2 photoShow
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
	 * 设置：民宿名称
	 */
    public String getMinsuName() {
        return minsuName;
    }


    /**
	 * 获取：民宿名称
	 */

    public void setMinsuName(String minsuName) {
        this.minsuName = minsuName;
    }
    /**
	 * 设置：房屋类型
	 */
    public Integer getFagwuTypes() {
        return fagwuTypes;
    }


    /**
	 * 获取：房屋类型
	 */

    public void setFagwuTypes(Integer fagwuTypes) {
        this.fagwuTypes = fagwuTypes;
    }
    /**
	 * 设置：价格/天
	 */
    public Double getMinsuNewMoney() {
        return minsuNewMoney;
    }


    /**
	 * 获取：价格/天
	 */

    public void setMinsuNewMoney(Double minsuNewMoney) {
        this.minsuNewMoney = minsuNewMoney;
    }
    /**
	 * 设置：房屋图片
	 */
    public String getMinsuPhoto() {
        return minsuPhoto;
    }


    /**
	 * 获取：房屋图片
	 */

    public void setMinsuPhoto(String minsuPhoto) {
        this.minsuPhoto = minsuPhoto;
    }
    /**
	 * 设置：地址
	 */
    public String getMinsuAddress() {
        return minsuAddress;
    }


    /**
	 * 获取：地址
	 */

    public void setMinsuAddress(String minsuAddress) {
        this.minsuAddress = minsuAddress;
    }
    /**
	 * 设置：房屋状态
	 */
    public Integer getFwstateTypes() {
        return fwstateTypes;
    }


    /**
	 * 获取：房屋状态
	 */

    public void setFwstateTypes(Integer fwstateTypes) {
        this.fwstateTypes = fwstateTypes;
    }
    /**
	 * 设置：所属房东
	 */
    public Integer getFangdongId() {
        return fangdongId;
    }


    /**
	 * 获取：所属房东
	 */

    public void setFangdongId(Integer fangdongId) {
        this.fangdongId = fangdongId;
    }
    /**
	 * 设置：具体信息
	 */
    public String getMinsuContent() {
        return minsuContent;
    }


    /**
	 * 获取：具体信息
	 */

    public void setMinsuContent(String minsuContent) {
        this.minsuContent = minsuContent;
    }
    /**
	 * 设置：创建时间 show1 show2 photoShow
	 */
    public Date getCreateTime() {
        return createTime;
    }


    /**
	 * 获取：创建时间 show1 show2 photoShow
	 */

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

}
