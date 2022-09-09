package com.service.impl;

import com.mapper.LeaveWordMapper;
import com.mapper.OwnerMapper;
import com.pojo.LeaveWord;
import com.pojo.Owner;
import com.service.LeavenWordService;
import com.util.DateUtils;
import com.util.UUIDUtils;
import com.vo.LeavenWordCndVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * 自出洞来无敌手 --
 * 2022/5/1
 */
@Service
public class LeavenWordServiceImpl implements LeavenWordService {
//   注入备注表对象
    @Autowired
    private LeaveWordMapper leaveWordMapper;

    //注入所有者表对象
    @Autowired
    private OwnerMapper ownerMapper;

    @Transactional(rollbackFor =Exception.class)
    @Override
    public int addLeavenWord(String context, String oname, String name) {

        //先查询出oname是否存在,存在则返回id并插入备注 不存在先新增oname后插入备注
        Owner o= ownerMapper.selectByNameIsExist(oname);

       if (o==null){
           //不存在此姓名 插入姓名和编号
           o=new Owner();
           o.setId(UUIDUtils.getUUID());
           o.setName(oname);
           ownerMapper.insertAll(o);
       }
        //验证是否是无效留言,如果重复内容为3条以上则取消插入
        int r=leaveWordMapper.selectLeaveWordIsFeasible(o.getId(),name,context);
        if (r>3){
            return 0;
        }
       //存在此姓名, 新建备注
        LeaveWord lw=new LeaveWord();
       lw.setContext(context);
       lw.setId(UUIDUtils.getUUID());
       lw.setOwner(o.getId());
       lw.setName(name);
       lw.setMessagetime(DateUtils.formatDateTime(new Date()));
        int result = leaveWordMapper.insertSelective(lw);

        return result;
    }

    /**
     * 用户查询单个留言
     * @param name
     * @return
     */
    @Override
    public List<LeaveWord> selectBySnameLike(String name) {
        List<LeaveWord> wordList= leaveWordMapper.selectBySnameLike(name);
        return wordList;
    }

    /**
     * 管理查询全部留言
     * @param name
     * @return
     */
    @Override
    public List<LeaveWord> selectByNameLikeAll(String name) {
        List<LeaveWord> wordList=  leaveWordMapper.selectByNameLikeAll(name);
        return wordList;
    }

    @Override
    public int deleteById(String id) {
        return leaveWordMapper.deleteByPrimaryKey(id);
    }

    @Override
    public List<LeaveWord> selectLeavenWordCnd(LeavenWordCndVO lwc) {
        //多条件查询留言
        List<LeaveWord> leaveWordList= leaveWordMapper.selectLeavenWordCnd(lwc);
        return leaveWordList;
    }
}
