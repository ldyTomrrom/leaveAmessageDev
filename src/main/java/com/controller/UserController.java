package com.controller;

import com.pojo.User;
import com.service.UserService;
import com.util.ReturnObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
        if (StringUtils.isEmpty(name) || StringUtils.isEmpty(pwd)){
            return "error.jsp";
        }
        User user= userService.selectByAccountIsExist(name,pwd);
        if (user==null){
            return "error.jsp";
        }
        request.getSession().setAttribute("user",user);



        return "Homepage.jsp";
    }
    @PostMapping("/user/register")
    public @ResponseBody Object  userRegister(HttpServletRequest request, @RequestParam("phone")String phone, @RequestParam("acct")String name, @RequestParam("pwd")String pwd){

       //注册用户
        int result= userService.insertUser(name,pwd,phone);
        if (result==0){
            return ReturnObject.fail("账户已存在");
        }
        if (result!=1){
            return ReturnObject.fail("注册失败");
        }

        return ReturnObject.success();
    }

}
