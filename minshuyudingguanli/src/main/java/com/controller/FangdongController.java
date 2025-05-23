













package com.controller;

import java.io.File;
import java.math.BigDecimal;
import java.net.URL;
import java.text.SimpleDateFormat;
import com.alibaba.fastjson.JSONObject;
import java.util.*;
import org.springframework.beans.BeanUtils;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.context.ContextLoader;
import javax.servlet.ServletContext;
import com.service.TokenService;
import com.utils.*;
import java.lang.reflect.InvocationTargetException;

import com.service.DictionaryService;
import org.apache.commons.lang3.StringUtils;
import com.annotation.IgnoreAuth;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.entity.*;
import com.entity.view.*;
import com.service.*;
import com.utils.PageUtils;
import com.utils.R;
import com.alibaba.fastjson.*;

/**
 * 房东
 * 后端接口
 * @author
 * @email
*/
@RestController
@Controller
@RequestMapping("/fangdong")
public class FangdongController {
    private static final Logger logger = LoggerFactory.getLogger(FangdongController.class);

    @Autowired
    private FangdongService fangdongService;


    @Autowired
    private TokenService tokenService;
    @Autowired
    private DictionaryService dictionaryService;

    //级联表service

    @Autowired
    private YonghuService yonghuService;


    /**
    * 后端列表
    */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params, HttpServletRequest request){
        logger.debug("page方法:,,Controller:{},,params:{}",this.getClass().getName(),JSONObject.toJSONString(params));
        String role = String.valueOf(request.getSession().getAttribute("role"));
        if(StringUtil.isEmpty(role))
            return R.error(511,"权限为空");
        else if("用户".equals(role))
            params.put("yonghuId",request.getSession().getAttribute("userId"));
        else if("房东".equals(role))
            params.put("fangdongId",request.getSession().getAttribute("userId"));
        if(params.get("orderBy")==null || params.get("orderBy")==""){
            params.put("orderBy","id");
        }
        PageUtils page = fangdongService.queryPage(params);

        //字典表数据转换
        List<FangdongView> list =(List<FangdongView>)page.getList();
        for(FangdongView c:list){
            //修改对应字典表字段
            dictionaryService.dictionaryConvert(c, request);
        }
        return R.ok().put("data", page);
    }

    /**
    * 后端详情
    */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id, HttpServletRequest request){
        logger.debug("info方法:,,Controller:{},,id:{}",this.getClass().getName(),id);
        FangdongEntity fangdong = fangdongService.selectById(id);
        if(fangdong !=null){
            //entity转view
            FangdongView view = new FangdongView();
            BeanUtils.copyProperties( fangdong , view );//把实体数据重构到view中

            //修改对应字典表字段
            dictionaryService.dictionaryConvert(view, request);
            return R.ok().put("data", view);
        }else {
            return R.error(511,"查不到数据");
        }

    }

    /**
    * 后端保存
    */
    @RequestMapping("/save")
    public R save(@RequestBody FangdongEntity fangdong, HttpServletRequest request){
        logger.debug("save方法:,,Controller:{},,fangdong:{}",this.getClass().getName(),fangdong.toString());

        String role = String.valueOf(request.getSession().getAttribute("role"));
        if(StringUtil.isEmpty(role))
            return R.error(511,"权限为空");
        Wrapper<FangdongEntity> queryWrapper = new EntityWrapper<FangdongEntity>()
            .eq("username", fangdong.getUsername())
            .or()
            .eq("fangdong_id_number", fangdong.getFangdongIdNumber())
            .or()
            .eq("fangdong_phone", fangdong.getFangdongPhone())
            ;

        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        FangdongEntity fangdongEntity = fangdongService.selectOne(queryWrapper);
        if(fangdongEntity==null){
            fangdong.setCreateTime(new Date());
            fangdong.setPassword("123456");
            fangdongService.insert(fangdong);
            return R.ok();
        }else {
            return R.error(511,"账户或者手机号或者身份证号已经被使用");
        }
    }

    /**
    * 后端修改
    */
    @RequestMapping("/update")
    public R update(@RequestBody FangdongEntity fangdong, HttpServletRequest request){
        logger.debug("update方法:,,Controller:{},,fangdong:{}",this.getClass().getName(),fangdong.toString());

        String role = String.valueOf(request.getSession().getAttribute("role"));
        if(StringUtil.isEmpty(role))
            return R.error(511,"权限为空");
        //根据字段查询是否有相同数据
        Wrapper<FangdongEntity> queryWrapper = new EntityWrapper<FangdongEntity>()
            .notIn("id",fangdong.getId())
            .andNew()
            .eq("username", fangdong.getUsername())
            .or()
            .eq("fangdong_id_number", fangdong.getFangdongIdNumber())
            .or()
            .eq("fangdong_phone", fangdong.getFangdongPhone())
            ;

        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        FangdongEntity fangdongEntity = fangdongService.selectOne(queryWrapper);
        if("".equals(fangdong.getFangdongPhoto()) || "null".equals(fangdong.getFangdongPhoto())){
                fangdong.setFangdongPhoto(null);
        }
        if(fangdongEntity==null){
            //  String role = String.valueOf(request.getSession().getAttribute("role"));
            //  if("".equals(role)){
            //      fangdong.set
            //  }
            fangdongService.updateById(fangdong);//根据id更新
            return R.ok();
        }else {
            return R.error(511,"账户或者手机号或者身份证号已经被使用");
        }
    }

    /**
    * 删除
    */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids){
        logger.debug("delete:,,Controller:{},,ids:{}",this.getClass().getName(),ids.toString());
        fangdongService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }

    /**
     * 批量上传
     */
    @RequestMapping("/batchInsert")
    public R save( String fileName){
        logger.debug("batchInsert方法:,,Controller:{},,fileName:{}",this.getClass().getName(),fileName);
        try {
            List<FangdongEntity> fangdongList = new ArrayList<>();//上传的东西
            Map<String, List<String>> seachFields= new HashMap<>();//要查询的字段
            Date date = new Date();
            int lastIndexOf = fileName.lastIndexOf(".");
            if(lastIndexOf == -1){
                return R.error(511,"该文件没有后缀");
            }else{
                String suffix = fileName.substring(lastIndexOf);
                if(!".xls".equals(suffix)){
                    return R.error(511,"只支持后缀为xls的excel文件");
                }else{
                    URL resource = this.getClass().getClassLoader().getResource("static/upload/" + fileName);//获取文件路径
                    File file = new File(resource.getFile());
                    if(!file.exists()){
                        return R.error(511,"找不到上传文件，请联系管理员");
                    }else{
                        List<List<String>> dataList = PoiUtil.poiImport(file.getPath());//读取xls文件
                        dataList.remove(0);//删除第一行，因为第一行是提示
                        for(List<String> data:dataList){
                            //循环
                            FangdongEntity fangdongEntity = new FangdongEntity();
//                            fangdongEntity.setUsername(data.get(0));                    //账户 要改的
//                            //fangdongEntity.setPassword("123456");//密码
//                            fangdongEntity.setFangdongName(data.get(0));                    //房东姓名 要改的
//                            fangdongEntity.setSexTypes(Integer.valueOf(data.get(0)));   //性别 要改的
//                            fangdongEntity.setFangdongIdNumber(data.get(0));                    //身份证号 要改的
//                            fangdongEntity.setFangdongPhone(data.get(0));                    //手机号 要改的
//                            fangdongEntity.setFangdongPhoto("");//照片
//                            fangdongEntity.setCreateTime(date);//时间
                            fangdongList.add(fangdongEntity);


                            //把要查询是否重复的字段放入map中
                                //账户
                                if(seachFields.containsKey("username")){
                                    List<String> username = seachFields.get("username");
                                    username.add(data.get(0));//要改的
                                }else{
                                    List<String> username = new ArrayList<>();
                                    username.add(data.get(0));//要改的
                                    seachFields.put("username",username);
                                }
                                //身份证号
                                if(seachFields.containsKey("fangdongIdNumber")){
                                    List<String> fangdongIdNumber = seachFields.get("fangdongIdNumber");
                                    fangdongIdNumber.add(data.get(0));//要改的
                                }else{
                                    List<String> fangdongIdNumber = new ArrayList<>();
                                    fangdongIdNumber.add(data.get(0));//要改的
                                    seachFields.put("fangdongIdNumber",fangdongIdNumber);
                                }
                                //手机号
                                if(seachFields.containsKey("fangdongPhone")){
                                    List<String> fangdongPhone = seachFields.get("fangdongPhone");
                                    fangdongPhone.add(data.get(0));//要改的
                                }else{
                                    List<String> fangdongPhone = new ArrayList<>();
                                    fangdongPhone.add(data.get(0));//要改的
                                    seachFields.put("fangdongPhone",fangdongPhone);
                                }
                        }

                        //查询是否重复
                         //账户
                        List<FangdongEntity> fangdongEntities_username = fangdongService.selectList(new EntityWrapper<FangdongEntity>().in("username", seachFields.get("username")));
                        if(fangdongEntities_username.size() >0 ){
                            ArrayList<String> repeatFields = new ArrayList<>();
                            for(FangdongEntity s:fangdongEntities_username){
                                repeatFields.add(s.getUsername());
                            }
                            return R.error(511,"数据库的该表中的 [账户] 字段已经存在 存在数据为:"+repeatFields.toString());
                        }
                         //身份证号
                        List<FangdongEntity> fangdongEntities_fangdongIdNumber = fangdongService.selectList(new EntityWrapper<FangdongEntity>().in("fangdong_id_number", seachFields.get("fangdongIdNumber")));
                        if(fangdongEntities_fangdongIdNumber.size() >0 ){
                            ArrayList<String> repeatFields = new ArrayList<>();
                            for(FangdongEntity s:fangdongEntities_fangdongIdNumber){
                                repeatFields.add(s.getFangdongIdNumber());
                            }
                            return R.error(511,"数据库的该表中的 [身份证号] 字段已经存在 存在数据为:"+repeatFields.toString());
                        }
                         //手机号
                        List<FangdongEntity> fangdongEntities_fangdongPhone = fangdongService.selectList(new EntityWrapper<FangdongEntity>().in("fangdong_phone", seachFields.get("fangdongPhone")));
                        if(fangdongEntities_fangdongPhone.size() >0 ){
                            ArrayList<String> repeatFields = new ArrayList<>();
                            for(FangdongEntity s:fangdongEntities_fangdongPhone){
                                repeatFields.add(s.getFangdongPhone());
                            }
                            return R.error(511,"数据库的该表中的 [手机号] 字段已经存在 存在数据为:"+repeatFields.toString());
                        }
                        fangdongService.insertBatch(fangdongList);
                        return R.ok();
                    }
                }
            }
        }catch (Exception e){
            return R.error(511,"批量插入数据异常，请联系管理员");
        }
    }

    /**
    * 登录
    */
    @IgnoreAuth
    @RequestMapping(value = "/login")
    public R login(String username, String password, String captcha, HttpServletRequest request) {
        FangdongEntity fangdong = fangdongService.selectOne(new EntityWrapper<FangdongEntity>().eq("username", username));
        if(fangdong==null || !fangdong.getPassword().equals(password))
            return R.error("账号或密码不正确");
        //  // 获取监听器中的字典表
        // ServletContext servletContext = ContextLoader.getCurrentWebApplicationContext().getServletContext();
        // Map<String, Map<Integer, String>> dictionaryMap= (Map<String, Map<Integer, String>>) servletContext.getAttribute("dictionaryMap");
        // Map<Integer, String> role_types = dictionaryMap.get("role_types");
        // role_types.get(.getRoleTypes());
        String token = tokenService.generateToken(fangdong.getId(),username, "fangdong", "房东");
        R r = R.ok();
        r.put("token", token);
        r.put("role","房东");
        r.put("username",fangdong.getFangdongName());
        r.put("tableName","fangdong");
        r.put("userId",fangdong.getId());
        return r;
    }

    /**
    * 注册
    */
    @IgnoreAuth
    @PostMapping(value = "/register")
    public R register(@RequestBody FangdongEntity fangdong){
//    	ValidatorUtils.validateEntity(user);
        Wrapper<FangdongEntity> queryWrapper = new EntityWrapper<FangdongEntity>()
            .eq("username", fangdong.getUsername())
            .or()
            .eq("fangdong_id_number", fangdong.getFangdongIdNumber())
            .or()
            .eq("fangdong_phone", fangdong.getFangdongPhone())
            ;
        FangdongEntity fangdongEntity = fangdongService.selectOne(queryWrapper);
        if(fangdongEntity != null)
            return R.error("账户或者手机号或者身份证号已经被使用");
        fangdong.setCreateTime(new Date());
        fangdongService.insert(fangdong);
        return R.ok();
    }

    /**
     * 重置密码
     */
    @GetMapping(value = "/resetPassword")
    public R resetPassword(Integer  id){
        FangdongEntity fangdong = new FangdongEntity();
        fangdong.setPassword("123456");
        fangdong.setId(id);
        fangdongService.updateById(fangdong);
        return R.ok();
    }

    /**
    * 获取用户的session用户信息
    */
    @RequestMapping("/session")
    public R getCurrFangdong(HttpServletRequest request){
        Integer id = (Integer)request.getSession().getAttribute("userId");
        FangdongEntity fangdong = fangdongService.selectById(id);
        if(fangdong !=null){
            //entity转view
            FangdongView view = new FangdongView();
            BeanUtils.copyProperties( fangdong , view );//把实体数据重构到view中

            //修改对应字典表字段
            dictionaryService.dictionaryConvert(view, request);
            return R.ok().put("data", view);
        }else {
            return R.error(511,"查不到数据");
        }
    }


    /**
    * 退出
    */
    @GetMapping(value = "logout")
    public R logout(HttpServletRequest request) {
        request.getSession().invalidate();
        return R.ok("退出成功");
    }




    /**
    * 前端列表
    */
    @IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params, HttpServletRequest request){
        logger.debug("list方法:,,Controller:{},,params:{}",this.getClass().getName(),JSONObject.toJSONString(params));

        // 没有指定排序字段就默认id倒序
        if(StringUtil.isEmpty(String.valueOf(params.get("orderBy")))){
            params.put("orderBy","id");
        }
        PageUtils page = fangdongService.queryPage(params);

        //字典表数据转换
        List<FangdongView> list =(List<FangdongView>)page.getList();
        for(FangdongView c:list)
            dictionaryService.dictionaryConvert(c, request); //修改对应字典表字段
        return R.ok().put("data", page);
    }

    /**
    * 前端详情
    */
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id, HttpServletRequest request){
        logger.debug("detail方法:,,Controller:{},,id:{}",this.getClass().getName(),id);
        FangdongEntity fangdong = fangdongService.selectById(id);
            if(fangdong !=null){
                //entity转view
                FangdongView view = new FangdongView();
                BeanUtils.copyProperties( fangdong , view );//把实体数据重构到view中

                //修改对应字典表字段
                dictionaryService.dictionaryConvert(view, request);
                return R.ok().put("data", view);
            }else {
                return R.error(511,"查不到数据");
            }
    }


    /**
    * 前端保存
    */
    @RequestMapping("/add")
    public R add(@RequestBody FangdongEntity fangdong, HttpServletRequest request){
        logger.debug("add方法:,,Controller:{},,fangdong:{}",this.getClass().getName(),fangdong.toString());
        Wrapper<FangdongEntity> queryWrapper = new EntityWrapper<FangdongEntity>()
            .eq("username", fangdong.getUsername())
            .or()
            .eq("fangdong_id_number", fangdong.getFangdongIdNumber())
            .or()
            .eq("fangdong_phone", fangdong.getFangdongPhone())
            ;
        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        FangdongEntity fangdongEntity = fangdongService.selectOne(queryWrapper);
        if(fangdongEntity==null){
            fangdong.setCreateTime(new Date());
        fangdong.setPassword("123456");
        //  String role = String.valueOf(request.getSession().getAttribute("role"));
        //  if("".equals(role)){
        //      fangdong.set
        //  }
        fangdongService.insert(fangdong);
            return R.ok();
        }else {
            return R.error(511,"账户或者手机号或者身份证号已经被使用");
        }
    }



}
