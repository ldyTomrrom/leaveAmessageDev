package com.service;

import com.pojo.User;

/**
 * 自出洞来无敌手 --
 * 2022/5/3
 */
public interface UserService {
    User selectByAccountIsExist(String name, String pwd);

    int insertUser(String name, String pwd, String phone);
}
