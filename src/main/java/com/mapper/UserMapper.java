package com.mapper;

import com.pojo.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    int deleteByPrimaryKey(Integer uid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer uid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User selectByAccountIsExist(@Param("name")String name,@Param("pwd")  String pwd);


    int insertUser(@Param("name") String name, @Param("pwd") String pwd, @Param("phone") String phone);

    User selectByAccount(@Param("name") String name);
}