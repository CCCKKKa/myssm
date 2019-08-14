package com.service.impl;

import com.dao.StuMapper;
import com.dao.UserMapper;
import com.github.pagehelper.PageHelper;
import com.poi.WriteExcel;
import com.pojo.Stu;
import com.pojo.User;
import com.service.StuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
@Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.DEFAULT,timeout = 5)//将整个类纳入spring事务管理
@Service("stuService")//自动注册到Spring容器
public class StuServiceImpl implements StuService {
    @Autowired
    private StuMapper stuMapper;//将StuMapper注入
    @Autowired
    private UserMapper userMapper;//将UserMapper注入
//添加学生信息的方法
    public void addStu(Stu stu) {
        HttpSession session= getSession();  //获取session对象
        String username=(String)session.getAttribute("username");//获取session属性的值
        User user=userMapper.getUserByUsername(username);//从userMapper中调用方法获取user对象
        stu.setUser(user);//将user对象传入setUser
        stuMapper.addStu(stu);//调用stuMapper中的addStu方法，将stu对象的值传入
    }

    private static HttpSession getSession() {//获取session对象的方法
        HttpSession session=null;//设置session对象为空
        try {
            session=getRequest().getSession();//从request中获取session对象
        }catch (Exception e){
        } return session;//返回session对象
    }
    private static HttpServletRequest getRequest() {    //获取请求信息的方法
        ServletRequestAttributes attrs=(ServletRequestAttributes) RequestContextHolder.getRequestAttributes();//获取请求
        return attrs.getRequest();//返回请求
    }
//删除学生的方法
    public void delStu(int stuid) {
        stuMapper.delStu(stuid);//调用stuMapper的删除学生方法
    }
//更新学生的方法
    public void updateStu(Stu stu) {
        stuMapper.updateStu(stu);//调用stuMapper的更新学生方法
    }
//通过stuid获取学生信息
    public Stu getStuById(int stuid) {
        Stu stu=stuMapper.getStuById(stuid);//通过stuid获取学生信息方法，调用mybatis方法
        return stu;
    }
    public Stu getStuByStuMajor(String stumajor){
        Stu stu=stuMapper.getStuByStuMjor(stumajor);
        return stu;
    }

    public Stu getTeaByStuMajor(String stumajor) {
        Stu stu=stuMapper.getTeaByStuMjor(stumajor);
        return stu;
    }

    public List<Stu> getPageStu(String searchPhrase,int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);//用于分页的核心代码
        List<Stu> list=stuMapper.getStuList(searchPhrase);//获取学生列表
        return list;//返回列表
    }
//获取学生数量
    public int getStuNum() {
        List<Stu> list=stuMapper.getStuList(null);//调用stuMapper的获取学生列表方法
        return list.size();//返回列表的规模
    }

    public InputStream getInputStream() throws Exception {
        String[] title=new String[]{"stuid","stuname","stumajor","phone","email","score"};//定义列表标题
        List<Stu> plist=stuMapper.getStuList(null);//调用获取学生信息列表的方法
        List<Object[]> dataList=new ArrayList<Object[]>();//新建列表
        for (int i=0;i<plist.size();i++){//写一个循环来输出学生信息
            Object[] obj=new Object[5];//留五个空位用来存放各个属性的数据
            obj[0]=plist.get(i).getStuid();//第一列存放stuid
            obj[1]=plist.get(i).getStuname();//第二列存放stuname
            obj[2]=plist.get(i).getStumajor();//第三列存放stumajor
            obj[3]=plist.get(i).getPhone();//第四列存放手机号
            obj[4]=plist.get(i).getMail();//第五列存放邮箱
            obj[5]=plist.get(i).getScore();//第五列存放邮箱
            dataList.add(obj);//添加进列表
        }
        WriteExcel ex=new WriteExcel(title,dataList);//导出为excel格式
        InputStream in;
        in=ex.export();
        return in;
    }

    public void batchDeleteStu(List stuIdList) {
        stuMapper.batchDeleteStu(stuIdList);
    }
}
