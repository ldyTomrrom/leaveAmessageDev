package com.service;

import com.pojo.LeaveWord;

import java.util.List;

/**
 * 自出洞来无敌手 --
 * 2022/5/1
 */
public interface LeavenWordService {
    int addLeavenWord(String context, String oname, String name);

    List<LeaveWord> selectBySnameLike(String name);

    List<LeaveWord> selectByNameLikeAll(String name);

    int deleteById(String id);
}
