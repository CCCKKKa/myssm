package com.dao;

import com.pojo.Stu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StuMapper {
    public void addStu(Stu stu);  //添加学生
    public void delStu(int stuid);//通过stuid删除学生
    public void updateStu(Stu stu); //更新学生信息
    public Stu getStuById(int stuid); //通过stuid获取学生信息
    public Stu getStuByStuMjor(String stumajor);
    public Stu getTeaByStuMjor(String stumajor);
    public List<Stu> getStuList(@Param(value = "searchPhrase")String searchPhrase); //用List列出学生信息  这里遇到的一个问题，如果不加这个注解的话，是查询不出任何结果的
    public void batchDeleteStu(@Param(value="stuIdList") List stuIdList);//通过stuid批量删除学生

}
