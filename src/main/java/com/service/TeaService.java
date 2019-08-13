package com.service;

import com.pojo.Stu;
import com.pojo.Tea;

import java.io.InputStream;
import java.util.List;

public interface TeaService {
    public void addTea(Tea tea);//添加教师信息
    public void delTea(int teid);//根据教师id删除教师信息
    public void updateTea(Tea tea);//更新教师信息
    public void updateTeaPerson(Tea tea);//教师更新个人信息
    public Tea getTeaById(int teid);//通过教师id查找教师姓名
    public List<Tea> getPageTea(String searchPhrase, int pageNum, int pageSize);//获取页表，定义pageNum页数和pageSize页面规模
    public int getTeaNum();//定义获取教师数量的方法
    InputStream getInputStream()throws Exception;//定义输入流方法    抛出异常
    public void batchDeleteTea(List teaIdList);
}
