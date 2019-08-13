package com.controller;


import com.pojo.*;
import com.service.StuService;
import com.service.TeaService;
import com.service.UserService;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/tea")
public class TeaController {
    /***
     *                                         ,s555SB@@&
     *                                      :9H####@@@@@Xi
     *                                     1@@@@@@@@@@@@@@8
     *                                   ,8@@@@@@@@@B@@@@@@8
     *                                  :B@@@@X3hi8Bs;B@@@@@Ah,
     *             ,8i                  r@@@B:     1S ,M@@@@@@#8;
     *            1AB35.i:               X@@8 .   SGhr ,A@@@@@@@@S
     *            1@h31MX8                18Hhh3i .i3r ,A@@@@@@@@@5
     *            ;@&i,58r5                 rGSS:     :B@@@@@@@@@@A
     *             1#i  . 9i                 hX.  .: .5@@@@@@@@@@@1
     *              sG1,  ,G53s.              9#Xi;hS5 3B@@@@@@@B1
     *               .h8h.,A@@@MXSs,           #@H1:    3ssSSX@1
     *               s ,@@@@@@@@@@@@Xhi,       r#@@X1s9M8    .GA981
     *               ,. rS8H#@@@@@@@@@@#HG51;.  .h31i;9@r    .8@@@@BS;i;
     *                .19AXXXAB@@@@@@@@@@@@@@#MHXG893hrX#XGGXM@@@@@@@@@@MS
     *                s@@MM@@@hsX#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&,
     *              :GB@#3G@@Brs ,1GM@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@B,
     *            .hM@@@#@@#MX 51  r;iSGAM@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8
     *          :3B@@@@@@@@@@@&9@h :Gs   .;sSXH@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:
     *      s&HA#@@@@@@@@@@@@@@M89A;.8S.       ,r3@@@@@@@@@@@@@@@@@@@@@@@@@@@r
     *   ,13B@@@@@@@@@@@@@@@@@@@5 5B3 ;.         ;@@@@@@@@@@@@@@@@@@@@@@@@@@@i
     *  5#@@#&@@@@@@@@@@@@@@@@@@9  .39:          ;@@@@@@@@@@@@@@@@@@@@@@@@@@@;
     *  9@@@X:MM@@@@@@@@@@@@@@@#;    ;31.         H@@@@@@@@@@@@@@@@@@@@@@@@@@:
     *   SH#@B9.rM@@@@@@@@@@@@@B       :.         3@@@@@@@@@@@@@@@@@@@@@@@@@@5
     *     ,:.   9@@@@@@@@@@@#HB5                 .M@@@@@@@@@@@@@@@@@@@@@@@@@B
     *           ,ssirhSM@&1;i19911i,.             s@@@@@@@@@@@@@@@@@@@@@@@@@@S
     *              ,,,rHAri1h1rh&@#353Sh:          8@@@@@@@@@@@@@@@@@@@@@@@@@#:
     *            .A3hH@#5S553&@@#h   i:i9S          #@@@@@@@@@@@@@@@@@@@@@@@@@A.
     *
     *
     *    
     */
    @Autowired
    public TeaService teaService;
    @Autowired
    public UserService userService;
    @Autowired
    public StuService stuService;

    @RequestMapping(value = "/teacher/teaList", method = RequestMethod.GET)
    public String teaList() {
        return "/teacher/teaList";
    }

    @RequestMapping(value = "/teaManStu",method = RequestMethod.GET)
    public String teamanstu(){
        return "teacher/teaManStu";
    }
    @RequestMapping(value = "/teaPerson",method = RequestMethod.GET)
    public String teaperson(){
        return "teacher/teaPerson";
    }
    @RequestMapping(value = "/teaApply",method = RequestMethod.GET)
    public String teaapply(){
        return "teacher/teaApply";
    }

    @RequestMapping(value = "/addTea", method = RequestMethod.POST)
    public String add(@RequestParam("tename") String tename,
                      @RequestParam("tepsd") String tepsd,
                      @RequestParam("major") String major,
                      @RequestParam("tephone") String tephone,
                      @RequestParam("temail") String temail) {
        Tea tea = new Tea();
        tea.setTename(tename);
        tea.setTepsd(tepsd);
        tea.setMajor(major);
        tea.setTephone(tephone);
        tea.setTemail(temail);
        teaService.addTea(tea);//持久化
        return "redirect:teacher/teaList";
    }

    //删除教师
    @RequestMapping(value = "/delTea", method = RequestMethod.POST)
    public String delete(@RequestParam("teid") int teid) {
        System.out.println("teid:" + teid);
        teaService.delTea(teid);
        return "redirect:teacher/teaList";//重定向到教师列表
    }

    //更新教师信息
    @RequestMapping(value = "/updateTea", method = RequestMethod.POST)
    public String update(@RequestParam("teid") int teid,
                         @RequestParam("tename") String tename,
                         @RequestParam("tepsd") String tepsd,
                         @RequestParam("major") String major,
                         @RequestParam("tephone") String tephone,
                         @RequestParam("temail") String temail) {
        Tea tea = new Tea();
        tea.setTeid(teid);
        tea.setTename(tename);
        tea.setTepsd(tepsd);
        tea.setMajor(major);
        tea.setTephone(tephone);
        tea.setTemail(temail);
        teaService.updateTea(tea);
        return "redirect:teacher/teaList";//重定向到教师列表
    }

    @RequestMapping(value = "getTeaInfo", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public Tea getTeaInfo(@RequestParam("teid") int teid) {
        Tea tea = teaService.getTeaById(teid);
        User user = userService.getUserByUsername("123");
        tea.setUser(user);
        return tea;
    }

    //获取学生列表
    @RequestMapping(value = "/teaList", produces = {"application/json;charset=UTF-8"})//这边错了忘记小写导致列表加载不出来
    @ResponseBody
    public TeaGrid getTeaList(@RequestParam("searchPhrase") String searchPhrase, @RequestParam("current") int current, @RequestParam("rowCount") int rowCout) {

        int total = teaService.getTeaNum();//获取学生总数
        List<Tea> list = teaService.getPageTea(searchPhrase, current, rowCout);
        TeaGrid teagrid = new TeaGrid();//实例化StuGird
        teagrid.setCurrent(current);
        teagrid.setRowCount(rowCout);
        teagrid.setRows(list);
        teagrid.setTotal(total);
        return teagrid;
    }



    @RequestMapping(value = "/tealistxml", produces = {"application/xml;charset=UTF-8"})
    @ResponseBody
    public TeaGrid gettealistxml(@RequestParam("current") int current, @RequestParam("rowCount") int rowCount) {
        int total = teaService.getTeaNum();
        List<Tea> list = teaService.getPageTea(null, current, rowCount);
        TeaGrid teaGrid = new TeaGrid();
        teaGrid.setCurrent(current);
        teaGrid.setRowCount(rowCount);
        teaGrid.setRows(list);
        teaGrid.setTotal(total);
        return teaGrid;
    }

    //导出教师表
    @RequestMapping("/exportTea")
    public void export(HttpServletResponse response) throws Exception {
        InputStream is = teaService.getInputStream();
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("contentDisposition", "attachment;filename=AllUsers.xls");
        ServletOutputStream output = response.getOutputStream();
        IOUtils.copy(is, output);
    }

    @RequestMapping("/batchDeleteTea")
    public String deleteTea(String teaIds) throws Exception {
        String[] stuIdArray = teaIds.split(",");
        List<String> teaIdList = new ArrayList<String>(Arrays.asList(stuIdArray));
        teaService.batchDeleteTea(teaIdList);
        return "redirect:teacher/teaList";//重定向到学生列表
    }
//映射跟请求不匹配
    @RequestMapping(value =  "/teaLogin", method = RequestMethod.POST)
    public String teaLogin(@RequestParam("teid") int teid, @RequestParam("tepsd") String tepsd, HttpSession httpSession) {
        if (teid ==0||tepsd == null) {
            return "user/teaLogin";
        } else {
            Tea tea = teaService.getTeaById(teid);
            if (tea.getTepsd().equals(tepsd)) {
                httpSession.setAttribute("tea", tea);
                return "teacher/teaManage";
            } else {
                return "redirect:/user/teaLogin";
            }
        }
    }


    @RequestMapping("/teaManage")
    public String teaManage(){
        return "teacher/teaManage";
    }
//教师更新学生信息
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
        return "teacher/teaManStu";
    }
    @RequestMapping(value = "/updateTeaPerson",method = RequestMethod.POST)
    public String updateTeaPerson(@RequestParam("teid") int teid,
                                  @RequestParam("tename") String tename,
                                  @RequestParam("tepsd") String tepsd,
                                  @RequestParam("major") String major,
                                  @RequestParam("tephone") String tephone,
                                  @RequestParam("temail") String temail,HttpSession httpSession,HttpServletRequest request){
        Tea tea = new Tea();
        tea.setTeid(teid);
        tea.setTename(tename);
        tea.setTepsd(tepsd);
        tea.setMajor(major);
        tea.setTephone(tephone);
        tea.setTemail(temail);
        teaService.updateTeaPerson(tea);
        return "teacher/teaPerson";
    }
}
