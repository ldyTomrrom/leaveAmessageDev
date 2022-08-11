package com.service.impl;


import com.mapper.UserMapper;
import com.pojo.User;
import com.service.UserService;
import com.util.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * 自出洞来无敌手 --
 * 2022/5/3
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;


    /**
     * 登录成功后修改登录时间
     * @param name
     * @param pwd
     * @return
     */
    @Override
    public User selectByAccountIsExist(String name, String pwd) {

        User user = userMapper.selectByAccountIsExist(name, pwd);
            if (user!=null){
                //更新用户登录时间
                user.setLastLoginTime(DateUtils.formatDateTime(new Date()));
              int result= userMapper.updateByPrimaryKeySelective(user);
            }
        return user;
    }
}
