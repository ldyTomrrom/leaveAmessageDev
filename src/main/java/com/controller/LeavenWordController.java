package com.controller;

import com.mapper.OwnerMapper;
import com.pojo.LeaveWord;
import com.service.LeavenWordService;
import com.util.ReturnObject;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 自出洞来无敌手 --
 * 2022/5/1
 */
@Controller
public class LeavenWordController {

//    注入备注表对象
   @Autowired
   private LeavenWordService leavenWordService;




    @PostMapping("/addLeavenWord")
    public @ResponseBody ReturnObject addLeavenWord(HttpServletRequest request,
                               @RequestParam("context") String context,
                               @RequestParam("ownerName")String oname,
                               @RequestParam("name")String name){
        ReturnObject result = ReturnObject.success();
        //添加备注
       int success=  leavenWordService.addLeavenWord(context,oname,name);
       if (success==0){
           return ReturnObject.fail("重复提交");
       }else if (success!=1){
            return ReturnObject.fail("提交失败,联系管理员处理");
        }


        return  result;

    }

    @RequestMapping("/selectBySnameLike")
    public String selectBySnameLike(HttpServletRequest request,@RequestParam("sname")String name){
        ReturnObject result = ReturnObject.success();
        //查询备注
       List<LeaveWord> wordList= leavenWordService.selectBySnameLike(name);

       request.setAttribute("wordList",wordList);
       if(!name.trim().isEmpty()){
           request.setAttribute("name",name);
       }


        return  "showLeaveWord.jsp";


    }
    @GetMapping("/selectByNameLikeAll")
    public String selectByNameLikeAll(HttpServletRequest request,@RequestParam("name")String name){
        //查询备注
       List<LeaveWord> wordList= leavenWordService.selectByNameLikeAll(name);

       request.setAttribute("wordList",wordList);


        return  "showAdminAll.jsp";
    }
    @RequestMapping("/deleteById")
    public String deleteById(@RequestParam("id")String id){
            //删除备注后跳转


        int result=leavenWordService.deleteById(id);
        if (result==1){

        }


        return  "showAdminAll.jsp";

    }

}
