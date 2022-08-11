package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 自出洞来无敌手 --
 * 2022/5/1
 */
@Controller
public class IndexController {


    @RequestMapping("/index/homepage")
    public String   index(){

        return "Homepage.jsp";
    }

}
