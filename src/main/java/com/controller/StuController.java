package com.controller;

import com.pojo.Stu;
import com.pojo.StuGrid;
import com.pojo.User;
import com.service.StuService;
import com.service.UserService;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller  //定义Controller接口
@RequestMapping("/stu")
public class StuController {
    /***
     * ┌───┐   ┌───┬───┬───┬───┐ ┌───┬───┬───┬───┐ ┌───┬───┬───┬───┐ ┌───┬───┬───┐
     * │Esc│   │ F1│ F2│ F3│ F4│ │ F5│ F6│ F7│ F8│ │ F9│F10│F11│F12│ │P/S│S L│P/B│  ┌┐    ┌┐    ┌┐
     * └───┘   └───┴───┴───┴───┘ └───┴───┴───┴───┘ └───┴───┴───┴───┘ └───┴───┴───┘  └┘    └┘    └┘
     * ┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───────┐ ┌───┬───┬───┐ ┌───┬───┬───┬───┐
     * │~ `│! 1│@ 2│# 3│$ 4│% 5│^ 6│& 7│* 8│( 9│) 0│_ -│+ =│ BacSp │ │Ins│Hom│PUp│ │N L│ / │ * │ - │
     * ├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─────┤ ├───┼───┼───┤ ├───┼───┼───┼───┤
     * │ Tab │ Q │ W │ E │ R │ T │ Y │ U │ I │ O │ P │{ [│} ]│ | \ │ │Del│End│PDn│ │ 7 │ 8 │ 9 │   │
     * ├─────┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴─────┤ └───┴───┴───┘ ├───┼───┼───┤ + │
     * │ Caps │ A │ S │ D │ F │ G │ H │ J │ K │ L │: ;│" '│ Enter  │               │ 4 │ 5 │ 6 │   │
     * ├──────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴────────┤     ┌───┐     ├───┼───┼───┼───┤
     * │ Shift  │ Z │ X │ C │ V │ B │ N │ M │< ,│> .│? /│  Shift   │     │ ↑ │     │ 1 │ 2 │ 3 │   │
     * ├─────┬──┴─┬─┴──┬┴───┴───┴───┴───┴───┴──┬┴───┼───┴┬────┬────┤ ┌───┼───┼───┐ ├───┴───┼───┤ E││
     * │ Ctrl│    │Alt │         Space         │ Alt│    │    │Ctrl│ │ ← │ ↓ │ → │ │   0   │ . │←─┘│
     * └─────┴────┴────┴───────────────────────┴────┴────┴────┴────┘ └───┴───┴───┘ └───────┴───┴───┘
     */
    /***
     *      ┌─┐       ┌─┐
     *   ┌──┘ ┴───────┘ ┴──┐
     *   │                         │
     *   │       ───           │
     *   │  ─┬┘       └┬─  │
     *   │                     │
     *   │       ─┴─       │
     *   │                  │
     *   └───┐         ┌───┘
     *       │         │
     *       │         │
     *       │         │
     *       │         └──────────────┐
     *       │                        │
     *       │                        ├─┐
     *       │                        ┌─┘
     *       │                        │
     *       └─┐  ┐  ┌───────┬──┐  ┌──┘
     *         │ ─┤ ─┤       │ ─┤ ─┤
     *         └──┴──┘       └──┴──┘
     */
    //注入service
    @Autowired
    private StuService stuService;
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/mark")
    public String mark(){
        return "/student/mark";
    }
    @RequestMapping(value = "/stuManage")
    public String stuManage(){
        return "/student/stuManage";
    }
    //学生列表
    @RequestMapping(value = "/student/stuList",method = RequestMethod.GET)
    public String stuList(){
        return "/student/stuList";
    }
    //添加学生
    @RequestMapping(value = "/addStu",method = RequestMethod.POST)
    public String add(@RequestParam("stuname")String stuname,
                      @RequestParam("stupsd")String stupsd,
                      @RequestParam("stumajor")String stumajor,
                      @RequestParam("phone")String phone,
                      @RequestParam("mail")String mail){
        Stu stu=new Stu();
        stu.setStuname(stuname);
        stu.setStupsd(stupsd);
        stu.setStumajor(stumajor);
        stu.setPhone(phone);
        stu.setMail(mail);
        stuService.addStu(stu);//忘记写持久化了......
        return "redirect:student/stuList";//重定向到学生列表
    }
    //注册学生
    @RequestMapping(value = "/regStu",method = RequestMethod.POST)
    public String regstu(@RequestParam("stuname")String stuname,
                         @RequestParam("stupsd")String stupsd,
                      @RequestParam("stumajor")String stumajor,
                      @RequestParam("phone")String phone,
                      @RequestParam("mail")String mail){
        Stu stu=new Stu();
        stu.setStuname(stuname);
        stu.setStupsd(stupsd);
        stu.setStumajor(stumajor);
        stu.setPhone(phone);
        stu.setMail(mail);
        //忘记写持久化了......
        stuService.addStu(stu);
        //重定向到学生列表
        return "redirect:/user/regist";
}
//删除学生
    @RequestMapping(value = "/delStu",method = RequestMethod.POST)
    public String delete(@RequestParam("stuid") int stuid){
        System.out.println("stuid:"+stuid);
        stuService.delStu(stuid);
        return "redirect:student/stuList";//重定向到学生列表
    }
    //更新学生信息
    @RequestMapping(value = "/updateStu",method = RequestMethod.POST)
    public String update(@RequestParam("stuid") int stuid,
                         @RequestParam("stuname") String stuname,
                         @RequestParam("stupsd")String stupsd,
                         @RequestParam("stumajor")String stumajor,
                         @RequestParam("phone")String phone,
                         @RequestParam("mail")String mail,
                         @RequestParam("score")String score){
        Stu stu=new Stu();
        stu.setStuid(stuid);
        stu.setStuname(stuname);
        stu.setStupsd(stupsd);
        stu.setStumajor(stumajor);
        stu.setPhone(phone);
        stu.setMail(mail);
        stu.setScore(score);
        stuService.updateStu(stu);
        //重定向到学生列表
        return "redirect:student/stuList";
    }
    @RequestMapping(value = "getStuInfo",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public Stu getStuInfo(@RequestParam("stuid") int stuid){
        Stu stu=stuService.getStuById(stuid);
        User user=userService.getUserByUsername("123");
        stu.setUser(user);
        return stu;
    }
    @RequestMapping(value = "/info")
    public String info(){
        return "/student/info";
    }
    @RequestMapping(value = "/info2")
    public String info2(){
        return "/student/info2";
    }
    //获取学生列表
    @RequestMapping(value = "/stuList",produces = {"application/json;charset=UTF-8"})//这边错了忘记小写导致列表加载不出来
    @ResponseBody
    public StuGrid getStuList(@RequestParam("searchPhrase")String searchPhrase,@RequestParam("current")int current,@RequestParam("rowCount")int rowCout){
        //获取学生总数
        int total=stuService.getStuNum();
        List<Stu> list=stuService.getPageStu(searchPhrase,current,rowCout);
        //实例化StuGird
        StuGrid stugrid=new StuGrid();
        stugrid.setCurrent(current);
        stugrid.setRowCount(rowCout);
        stugrid.setRows(list);
        stugrid.setTotal(total);
        return stugrid;
    }
    @RequestMapping(value="/stulistxml",produces = {"application/xml;charset=UTF-8"})
    @ResponseBody
    public StuGrid getstulistxml(@RequestParam("current") int current,@RequestParam("rowCount") int rowCount){
        int total = stuService.getStuNum();
        List<Stu>  list = stuService.getPageStu(null,current,rowCount);
        StuGrid stuGrid = new StuGrid();
        stuGrid.setCurrent(current);
        stuGrid.setRowCount(rowCount);
        stuGrid.setRows(list);
        stuGrid.setTotal(total);
        return stuGrid;
    }
    //导出学生表
    @RequestMapping("/exportStu")
    public void export(HttpServletResponse response) throws Exception{
        InputStream is=stuService.getInputStream();
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("contentDisposition", "attachment;filename=AllUsers.xls");
        ServletOutputStream output = response.getOutputStream();
        IOUtils.copy(is,output);
    }


    //批量删除学生信息
    @RequestMapping("/batchDeleteStu")
    public String deleteStu(String stuIds) throws Exception{
        String[] stuIdArray = stuIds.split(",");
        List<String> stuIdList = new ArrayList<String>(Arrays.asList(stuIdArray));
        stuService.batchDeleteStu(stuIdList);
        //重定向到学生列表
        return "redirect:student/stuList";
    }

    //学生登陆
    @RequestMapping(value = "/stuLogin",method = RequestMethod.POST)
    public String stuLogin(@RequestParam("stuid") int stuid,
                           @RequestParam("stupsd") String stupsd,
                           HttpSession httpSession){
        if (stuid==0||stupsd==null){
            return "/user/stuLogin";
        }else {
            Stu stu=stuService.getStuById(stuid);
            if (stu.getStupsd().equals(stupsd)){
                httpSession.setAttribute("stu",stu);
                return "student/stuManage";
            }
        }
        return "/user/stuLogin";
    }

    //查询学生分数
    @RequestMapping(value = "/stuScore")
    public String stuScore(){
        return "/student/stuScore";
    }
    //补考管理
    @RequestMapping(value = "/stuScoreMan",method = RequestMethod.POST)
    public String stuScoreMan(@RequestParam("score")int score){
        if (score>=60){
            return "/student/stuScore";
        }else {
            return "/student/stuExam";
        }
    }


}
