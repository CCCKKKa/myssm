package com.service;

import com.pojo.Stu;

import java.io.InputStream;
import java.util.List;


public interface StuService {
    public void addStu(Stu stu);//添加学生信息
    public void delStu(int stuid);//根据stuid删除学生信息
    public void updateStu(Stu stu);//更新学生信息
    public Stu getStuById(int stuid);//通过stuid获取学生信息
    public Stu getStuByStuMajor(String stumajor);
    public Stu getTeaByStuMajor(String stumajor);
    public List<Stu> getPageStu(String searchPhrase,int pageNum,int pageSize);//获取页表，定义pageNum页数和pageSize页面规模
    public int getStuNum();//定义获取学生数量的方法
    InputStream getInputStream()throws Exception;//定义输入流方法    抛出异常

    void batchDeleteStu(List stuIdList);
}
