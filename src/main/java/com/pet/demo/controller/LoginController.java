package com.pet.demo.controller;

import com.pet.demo.entity.Admin;
import com.pet.demo.entity.User;
import com.pet.demo.service.AdminService;
import com.pet.demo.service.UserService;
import com.pet.demo.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller//@Controller 注解表明这是一个 Spring MVC 控制器类
public class LoginController {
    @Autowired//@Autowired 注解，Spring 会自动将 UserService 和 AdminService 的实例注入到 LoginController 类中。
    private UserService userService;
    @Autowired
    private AdminService adminService;
//    @GetMapping("/login") 注解表示该方法
//    处理 /login 的 GET 请求。跳转到名为 login 的视图页面。
    @GetMapping("/login")
    public String login() {
        return "login";
    }
//    处理 POST 请求 /login



//    登录相关的
    @PostMapping("/login")
    public String userLogin(@RequestParam("Account") String Account,
                            @RequestParam("Password") String Password,
                            @RequestParam("role") String role,
                            Model model,
                            HttpSession session) {

        if (role.equals("管理员")) {
            //    若角色为 “管理员”，则调用 adminService.loading 方法验证管理员信息。
//    若验证失败，会将错误信息添加到 Model 中，并返回 login 视图页面；
//    若验证成功，会将管理员的姓名和 ID 存入 HttpSession，然后重定向到 /manage 页面。
            if (adminService.loading(Account, Password) == null) {
                model.addAttribute("error", "该用户不存在");
                return "/login";
            }
            Admin loading = adminService.loading(Account, Password);
            if (loading != null) {
//                管理员身份信息验证成功时候，登录到管理员后台manage
                session.setAttribute("Name", loading.getAdminName());
                session.setAttribute("Id", loading.getAdminId());
                return "redirect:/manage";
            } else {
                model.addAttribute("error", "用户名或密码错误，请检查后重试");
                return "/login";
            }


        } else {
//            若角色不是 “管理员”，则调用 userService.login 方法验证普通用户信息。
//            若验证失败，会将错误信息添加到 Model 中，并返回 login 视图页面；若验证成功，
//            会将用户的姓名、ID 和用户对象存入 HttpSession，然后重定向到 /index 页面。

            // 对用户输入的密码进行MD5加密
            String encryptedPassword = MD5Util.encrypt(Password);

            if (userService.login(Account, encryptedPassword) == null) {
                model.addAttribute("error", "该用户不存在");
                return "/login";
            }
            User login = userService.login(Account, encryptedPassword);
            if (login != null) {
                session.setAttribute("Name", login.getUserName());
                session.setAttribute("Id", login.getUserId());
                session.setAttribute("user", login);
                //                return "redirect:/index";
                //新加 重定向到choice.html
                return "redirect:/choice";
            } else {
                model.addAttribute("error", "用户名或密码错误，请检查后重试");
                return "/login";
            }
        }
    }

    // 新加 添加choice页面的控制器方法
    @GetMapping("/choice")
    public String showChoicePage() {
        return "choice";
    }

    // 退出登录时，显示首页，显示的是没登陆状态下的  首页，宠物领养，个人中心哦
//    此方法会从 HttpSession 中移除 "Name" 属性，然后重定向到 /index 页面。
    @GetMapping("logout")
    private String logout(HttpSession session) {
        session.removeAttribute("Name");
        return "redirect:/index";
    }

    // 跳转到注册页面
    @GetMapping("/register")
    public String toRegister() {
        return "register";
    }



//     注册相关的
    @PostMapping("register")
    public String Register(@RequestParam("Account") String Account,
                           @RequestParam("Name") String Name,
                           @RequestParam("Password") String Password,
                           User user,
                           Model model,
                           HttpSession session) {
        // 如果用户不存在方可注册
        if (userService.findByAccount(Account) == null) {
            user.setUserAccount(Account);
            user.setUserName(Name);

            // 对密码进行MD5加密,进行加密之后在保存到数据库里边
            String encryptedPassword = MD5Util.encrypt(Password);
            user.setUserPassword(encryptedPassword);

//            user.setUserPassword(Password);

            userService.save(user);
            session.setAttribute("Name", user.getUserName());
            session.setAttribute("Id", user.getUserId());
            session.setAttribute("user", user);
            return "redirect:/index";
        } else {
            model.addAttribute("error", "该账号已存在，请重新注册");
            return "/register";
        }
    }




}