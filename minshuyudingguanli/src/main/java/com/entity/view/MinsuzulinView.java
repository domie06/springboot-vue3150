package com.entity.view;

import com.entity.MinsuzulinEntity;
import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.io.Serializable;
import java.util.Date;

/**
 * 民宿租赁
 * 后端返回视图实体辅助类
 * （通常后端关联的表或者自定义的字段需要返回使用）
 */
@TableName("minsuzulin")
public class MinsuzulinView extends MinsuzulinEntity implements Serializable {
    private static final long serialVersionUID = 1L;




		//级联表 minsu
			/**
			* 民宿名称
			*/
			private String minsuName;
			/**
			* 房屋类型
			*/
			private Integer fagwuTypes;
				/**
				* 房屋类型的值
				*/
				private String fagwuValue;
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
				* 房屋状态的值
				*/
				private String fwstateValue;
			/**
			* 具体信息
			*/
			private String minsuContent;

		//级联表 yonghu
			/**
			* 用户姓名
			*/
			private String yonghuName;
			/**
			* 身份证号
			*/
			private String yonghuIdNumber;
			/**
			* 手机号
			*/
			private String yonghuPhone;
			/**
			* 照片
			*/
			private String yonghuPhoto;

	public MinsuzulinView() {

	}

	public MinsuzulinView(MinsuzulinEntity minsuzulinEntity) {
		try {
			BeanUtils.copyProperties(this, minsuzulinEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}



















				//级联表的get和set minsu
					/**
					* 获取： 民宿名称
					*/
					public String getMinsuName() {
						return minsuName;
					}
					/**
					* 设置： 民宿名称
					*/
					public void setMinsuName(String minsuName) {
						this.minsuName = minsuName;
					}
					/**
					* 获取： 房屋类型
					*/
					public Integer getFagwuTypes() {
						return fagwuTypes;
					}
					/**
					* 设置： 房屋类型
					*/
					public void setFagwuTypes(Integer fagwuTypes) {
						this.fagwuTypes = fagwuTypes;
					}


						/**
						* 获取： 房屋类型的值
						*/
						public String getFagwuValue() {
							return fagwuValue;
						}
						/**
						* 设置： 房屋类型的值
						*/
						public void setFagwuValue(String fagwuValue) {
							this.fagwuValue = fagwuValue;
						}
					/**
					* 获取： 价格/天
					*/
					public Double getMinsuNewMoney() {
						return minsuNewMoney;
					}
					/**
					* 设置： 价格/天
					*/
					public void setMinsuNewMoney(Double minsuNewMoney) {
						this.minsuNewMoney = minsuNewMoney;
					}
					/**
					* 获取： 房屋图片
					*/
					public String getMinsuPhoto() {
						return minsuPhoto;
					}
					/**
					* 设置： 房屋图片
					*/
					public void setMinsuPhoto(String minsuPhoto) {
						this.minsuPhoto = minsuPhoto;
					}
					/**
					* 获取： 地址
					*/
					public String getMinsuAddress() {
						return minsuAddress;
					}
					/**
					* 设置： 地址
					*/
					public void setMinsuAddress(String minsuAddress) {
						this.minsuAddress = minsuAddress;
					}
					/**
					* 获取： 房屋状态
					*/
					public Integer getFwstateTypes() {
						return fwstateTypes;
					}
					/**
					* 设置： 房屋状态
					*/
					public void setFwstateTypes(Integer fwstateTypes) {
						this.fwstateTypes = fwstateTypes;
					}


						/**
						* 获取： 房屋状态的值
						*/
						public String getFwstateValue() {
							return fwstateValue;
						}
						/**
						* 设置： 房屋状态的值
						*/
						public void setFwstateValue(String fwstateValue) {
							this.fwstateValue = fwstateValue;
						}
					/**
					* 获取： 具体信息
					*/
					public String getMinsuContent() {
						return minsuContent;
					}
					/**
					* 设置： 具体信息
					*/
					public void setMinsuContent(String minsuContent) {
						this.minsuContent = minsuContent;
					}






















				//级联表的get和set yonghu
					/**
					* 获取： 用户姓名
					*/
					public String getYonghuName() {
						return yonghuName;
					}
					/**
					* 设置： 用户姓名
					*/
					public void setYonghuName(String yonghuName) {
						this.yonghuName = yonghuName;
					}
					/**
					* 获取： 身份证号
					*/
					public String getYonghuIdNumber() {
						return yonghuIdNumber;
					}
					/**
					* 设置： 身份证号
					*/
					public void setYonghuIdNumber(String yonghuIdNumber) {
						this.yonghuIdNumber = yonghuIdNumber;
					}
					/**
					* 获取： 手机号
					*/
					public String getYonghuPhone() {
						return yonghuPhone;
					}
					/**
					* 设置： 手机号
					*/
					public void setYonghuPhone(String yonghuPhone) {
						this.yonghuPhone = yonghuPhone;
					}
					/**
					* 获取： 照片
					*/
					public String getYonghuPhoto() {
						return yonghuPhoto;
					}
					/**
					* 设置： 照片
					*/
					public void setYonghuPhoto(String yonghuPhoto) {
						this.yonghuPhoto = yonghuPhoto;
					}



}
