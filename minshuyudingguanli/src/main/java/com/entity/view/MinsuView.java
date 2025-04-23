package com.entity.view;

import com.entity.MinsuEntity;
import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.io.Serializable;
import java.util.Date;

/**
 * 民宿信息
 * 后端返回视图实体辅助类
 * （通常后端关联的表或者自定义的字段需要返回使用）
 */
@TableName("minsu")
public class MinsuView extends MinsuEntity implements Serializable {
    private static final long serialVersionUID = 1L;

		/**
		* 房屋类型的值
		*/
		private String fagwuValue;
		/**
		* 房屋状态的值
		*/
		private String fwstateValue;



		//级联表 fangdong
			/**
			* 房东姓名
			*/
			private String fangdongName;
			/**
			* 身份证号
			*/
			private String fangdongIdNumber;
			/**
			* 手机号
			*/
			private String fangdongPhone;
			/**
			* 照片
			*/
			private String fangdongPhoto;

	public MinsuView() {

	}

	public MinsuView(MinsuEntity minsuEntity) {
		try {
			BeanUtils.copyProperties(this, minsuEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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










				//级联表的get和set fangdong
					/**
					* 获取： 房东姓名
					*/
					public String getFangdongName() {
						return fangdongName;
					}
					/**
					* 设置： 房东姓名
					*/
					public void setFangdongName(String fangdongName) {
						this.fangdongName = fangdongName;
					}
					/**
					* 获取： 身份证号
					*/
					public String getFangdongIdNumber() {
						return fangdongIdNumber;
					}
					/**
					* 设置： 身份证号
					*/
					public void setFangdongIdNumber(String fangdongIdNumber) {
						this.fangdongIdNumber = fangdongIdNumber;
					}
					/**
					* 获取： 手机号
					*/
					public String getFangdongPhone() {
						return fangdongPhone;
					}
					/**
					* 设置： 手机号
					*/
					public void setFangdongPhone(String fangdongPhone) {
						this.fangdongPhone = fangdongPhone;
					}
					/**
					* 获取： 照片
					*/
					public String getFangdongPhoto() {
						return fangdongPhoto;
					}
					/**
					* 设置： 照片
					*/
					public void setFangdongPhoto(String fangdongPhoto) {
						this.fangdongPhoto = fangdongPhoto;
					}


















}
