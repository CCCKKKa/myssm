package com.dao;

import com.pojo.Stu;
import com.pojo.Tea;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TeaMapper {
    public void addTea(Tea tea);//添加教师信息
    public void delTea(int teid);//根据教师id删除教师信息
    public void updateTea(Tea tea);//更新教师信息
    public void updateTeaPerson(Tea tea);
    public Tea getTeaById(int teid);//通过教师id查找教师姓名
    public List<Tea> getTeaList(@Param(value = "searchPhrase")String searchPhrase);
    public void batchDeleteTea(@Param(value="teaIdList") List teaIdList);//通过stuid批量删除教师
}
