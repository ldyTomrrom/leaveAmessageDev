package com.mapper;

import com.pojo.LeaveWord;
import com.vo.LeavenWordCndVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LeaveWordMapper {
    int deleteByPrimaryKey(String id);

    int insert(LeaveWord record);

    int insertSelective(LeaveWord record);

    LeaveWord selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(LeaveWord record);

    int updateByPrimaryKey(LeaveWord record);

    List<LeaveWord> selectBySnameLike(@Param("name") String name);

    List<LeaveWord> selectByNameLikeAll(@Param("name") String name);

    int selectLeaveWordIsFeasible(@Param("oid") String oId,@Param("name") String name, @Param("context") String context);

    List<LeaveWord> selectLeavenWordCnd(LeavenWordCndVO lwc);
}