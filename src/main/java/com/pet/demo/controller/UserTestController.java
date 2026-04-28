package com.pet.demo.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pet.demo.entity.User;
import com.pet.demo.service.UserService;
import com.pet.demo.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/front")
public class UserTestController {
    @Autowired
    private UserService userService;


    @GetMapping("/user")
    public String findAll(Model model, @RequestParam(defaultValue = "1") Integer pageNum,
                          @RequestParam(name = "searchName",required = false) String searchName){
        model.addAttribute("url", "/front/user");
        if(StringUtils.isEmpty(searchName)){
            PageHelper.startPage(pageNum,5);
            List<User> userList=userService.findAll();
            PageInfo<User> pageInfo = new PageInfo<>(userList);
            model.addAttribute("pagelist",pageInfo);
            return "user";
        }
        else {
            String name='%'+searchName+'%';
            PageHelper.startPage(pageNum,5);
            List<User> users=userService.findByName(name);
            PageInfo<User> pageInfo = new PageInfo<>(users);
            model.addAttribute("pagelist",pageInfo);
            return "user";
        }
    }

    @PostMapping("/save")
    public String save( User user){
        //        判断添加还是修改操作
        if(StringUtils.isEmpty(user.getUserId())){
//修改操作user.html
//UserTestController这里还是存在问题，假设它没有动密码，但是修改其他的，也触发了密码刷新MD5,此时在去登录，密码被强制改了，已修复
            // 增加部分 加密密码
            user.setUserPassword(MD5Util.encrypt(user.getUserPassword()));

            userService.save(user);

        }else {

            // 获取数据库中的原用户信息
            User originalUser = userService.findOne(user.getUserId());

            if (originalUser != null) {
                // 比较原密码和用户提交的密码是否一致
                if (!originalUser.getUserPassword().equals(user.getUserPassword())) {
                    // 密码不一致，进行 MD5 加密
                    user.setUserPassword(MD5Util.encrypt(user.getUserPassword()));
                } else {
                    // 密码一致，使用原密码
                    user.setUserPassword(originalUser.getUserPassword());
                }
            }
            userService.update(user);
        }
        return "redirect:/front/user";
    }
//    RedirectAttributes 重定向之后仍能携带参数
    @PostMapping("/infoUpdate")
    public String infoUpdate(User user, HttpSession session, RedirectAttributes attributes){
        userService.update(user);
        session.setAttribute("user",user);
        attributes.addFlashAttribute("message","保存成功");
        return "redirect:/info";
    }
//   ajax的密码修改功能
    @PostMapping("/updatePsd")
    @ResponseBody
    public String updatePsd( String oldPassword,String newPassword,String psdId
                             )  {
        User user = userService.findOne(psdId);
        String msg = "0";
        if(oldPassword.isEmpty()){
            return msg;
        }

        // 加密旧密码进行比对
        if(MD5Util.encrypt(oldPassword).equals(user.getUserPassword())){

            // 加密新密码
            user.setUserPassword(MD5Util.encrypt(newPassword));

//            user.setUserPassword(newPassword);
            userService.update(user);
           msg="修改成功";
        }else {
            msg="修改失败";
        }
        return msg;
    }

    @GetMapping("/findByName")
    public String findByName( Model model, @RequestParam(defaultValue = "1") Integer pageNum,
            @RequestParam(name = "searchName",required = false) String searchName){
        String name="%"+searchName+"%";
        PageHelper.startPage(pageNum,5);
        List<User> users=userService.findByName(name);
        PageInfo<User> pageInfo = new PageInfo<>(users);
        model.addAttribute("users",pageInfo);
        return "user";

    }

    @GetMapping("/delete")
    public String delete( String userId){
        userService.delete(userId);
        return "redirect:/front/user";
    }


}
