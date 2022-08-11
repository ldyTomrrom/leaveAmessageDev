package com.mapper;

import com.pojo.Owner;
import org.apache.ibatis.annotations.Param;

public interface OwnerMapper {
    int deleteByPrimaryKey(String id);

    int insert(Owner record);

    int insertSelective(Owner record);

    Owner selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Owner record);

    int updateByPrimaryKey(Owner record);

    Owner selectByNameIsExist(@Param("oname") String oname);

    int insertAll(@Param("owner") Owner owner);
}