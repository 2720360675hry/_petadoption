package com.pet.demo.controller;

import com.pet.demo.entity.*;
import com.pet.demo.exception.CustomizeErrorCode;
import com.pet.demo.exception.CustomizeException;
import com.pet.demo.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class IndexController {
//    @Autowired 注解用于自动注入所需的服务类实例，这些服务类负责与数据库交互，执行具体的业务逻辑。
    @Autowired
    private PetService petService;
    @Autowired
    private ApplyService applyService;
    @Autowired
    private SysLogService sysLogService;
    @Autowired
    private UserLogService userLogService;
//首页
    @GetMapping("/index")
    public String index(){

        return "index";
    }
//    后台管理页面
//    该方法处理 /manage 的 GET 请求，
//    从 SysLogService 和 UserLogService 中获取系统日志和用户日志列表，
//    并将它们添加到 Model 中，然后返回名为 manage 的视图。
    @GetMapping("/manage")
    public String manage(Model model){
        List<SysLog> sysLogs=sysLogService.findAll();
        List<UserLog> userLogs=userLogService.findAll();
        model.addAttribute("logs",sysLogs);
        model.addAttribute("userLogs",userLogs);
        return "manage";
    }
//    导航条
    @GetMapping("/navigation")
    public String nav(){
        return "navigation";
    }
//    个人信息页面
    @GetMapping("/info")
    public String userInfo(){
        return "info";
    }
    @PostMapping("/getList")
    public String getList(String applyUserId,Model model){
        List<Apply> list = applyService.findUser(applyUserId);
        model.addAttribute("list",list);
        return "info::tb1";
    }
//    宠物信息展示
    @GetMapping("/adoption/{id}")
    public String petAdoption(@PathVariable(name = "id")String id,Model model)
    {
        Pet pet=petService.findOne(id);
        if(pet==null){
            throw new CustomizeException(CustomizeErrorCode.PET_NOT_FOUND);
        }
        model.addAttribute("pet",pet);
        return "adoption";

    }
//宠物列表
    @GetMapping("/show")
    public String showPet(Model model){
        List<Pet> pets=petService.findPet("未领养");
        model.addAttribute("pets",pets);
        return "show";
    }

}
