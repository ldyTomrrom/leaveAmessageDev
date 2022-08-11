package com.controller;

import com.pojo.User;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 自出洞来无敌手 --
 * 2022/5/3
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/user/login")
    public String  userLogin(HttpServletRequest request, @RequestParam("username")String name, @RequestParam("password")String pwd){
       //登录用户
        if (name.trim().isEmpty() || pwd.trim().isEmpty()){
            return "error.jsp";
        }
        User user= userService.selectByAccountIsExist(name,pwd);
        if (user==null){
            return "error.jsp";
        }
        request.getSession().setAttribute("user",user);



        return "indexPage.jsp";
    }

}
