package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Random;

/**
 * 自出洞来无敌手 --
 * 2022/5/22
 */
@Controller
public class FileUploadingController {


    @PostMapping("/fileUploading")
    @ResponseBody
    public String fileUploading(@RequestParam("file") MultipartFile file, HttpServletRequest request, HttpSession session) {
        StringBuilder sb = new StringBuilder("结果 =");

        String name = file.getOriginalFilename();
        String url="D:\\lea\\file";
        File f=new File(url);
        if (!f.exists()){

            f.mkdirs();
        }
        sb.append("name=" + name);
        sb.append("url=" + url);
        try {
            file.transferTo(new File(url+File.separator+name));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return sb.toString();
    }

}
