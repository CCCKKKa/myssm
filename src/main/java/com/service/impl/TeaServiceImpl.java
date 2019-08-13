package com.service.impl;

import com.dao.StuMapper;
import com.dao.TeaMapper;
import com.dao.UserMapper;
import com.github.pagehelper.PageHelper;
import com.poi.WriteExcel;
import com.pojo.Tea;
import com.pojo.User;
import com.service.TeaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

@Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.DEFAULT,timeout = 5)//将整个类纳入spring事务管理
@Service("teaService")//自动注册到Spring容器
public class TeaServiceImpl implements TeaService {
    @Autowired
    private StuMapper stuMapper;
    @Autowired
    private TeaMapper teaMapper;
    @Autowired
    private UserMapper userMapper;
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
    public void addTea(Tea tea) {
        HttpSession session=getSession();
        String username=(String)session.getAttribute("username");//获取session属性的值
        User user=userMapper.getUserByUsername(username);//从userMapper中调用方法获取user对象
        tea.setUser(user);//将user对象传入setUser
        teaMapper.addTea(tea);//调用stuMapper中的addStu方法，将stu对象的值传入
    }
    public void delTea(int teid) {
        teaMapper.delTea(teid);
    }

    public void updateTea(Tea tea) {
        teaMapper.updateTea(tea);
    }

    public void updateTeaPerson(Tea tea){
        teaMapper.updateTeaPerson(tea);
    }

    public Tea getTeaById(int teid) {
        Tea tea=teaMapper.getTeaById(teid);
        return tea;
    }

    public List<Tea> getPageTea(String searchPhrase, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);//用于分页的核心代码
        List<Tea> list=teaMapper.getTeaList(searchPhrase);//获取学生列表
        return list;//返回列表
    }

    public int getTeaNum() {
        List<Tea> list=teaMapper.getTeaList(null);
        return list.size();
    }

    public InputStream getInputStream() throws Exception {
        String[] title=new String[]{"teid","tename","tephone","temail","major"};//定义列表标题
        List<Tea> plist=teaMapper.getTeaList(null);//调用获取学生信息列表的方法
        List<Object[]> dataList=new ArrayList<Object[]>();//新建列表
        for (int i=0;i<plist.size();i++){//写一个循环来输出学生信息
            Object[] obj=new Object[5];//留五个空位用来存放各个属性的数据
            obj[0]=plist.get(i).getTeid();//第一列存放stuid
            obj[1]=plist.get(i).getTename();//第二列存放stuname
            obj[2]=plist.get(i).getTephone();//第三列存放stumajor
            obj[3]=plist.get(i).getTemail();//第四列存放手机号
            obj[4]=plist.get(i).getMajor();//第五列存放邮箱
            dataList.add(obj);//添加进列表
        }
        WriteExcel ex=new WriteExcel(title,dataList);//导出为excel格式
        InputStream in;
        in=ex.export();
        return in;
    }


    public void batchDeleteTea(List teaIdList) {
        teaMapper.batchDeleteTea(teaIdList);

    }
}
