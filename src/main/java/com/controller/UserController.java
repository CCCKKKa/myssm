package com.controller;

import com.aliyuncs.CommonRequest;
import com.aliyuncs.CommonResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import com.pojo.User;
import com.service.TeaService;
import com.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.UUID;

@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Resource
    private UserService userService;
    @Resource
    private TeaService teaService;

    @RequestMapping(value = "/addUser",method = RequestMethod.GET)
    public String addUser(@ModelAttribute("user") User user1) {
        //检测该用户是否已经存在
        User user=userService.getUserByUsername(user1.getUser_name());
        if(user==null) {
            return "redirect:user/register";
        }
        return "redirect:user/login";
    }

    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String login() {
        return "user/login";
    }

    @RequestMapping(value = "/stuLogin",method = RequestMethod.GET)
    public String stuLogin() {
        return "user/stuLogin";
    }

    @RequestMapping(value = "/teaLogin",method = RequestMethod.GET)
    public String teachLogin() {
        return "user/teaLogin";
    }

    @RequestMapping(value = "/welcome",method = RequestMethod.GET)
    public String welcome() {
        return "user/welcome";
    }

    @RequestMapping(value = "/userLogin",method = RequestMethod.GET)
    public String userLogin(){
        return "user/userLogin";
    }

    @RequestMapping(value = "/regist",method = RequestMethod.GET)
    public String regist() {
        return "user/regist";
    }

    @RequestMapping(value = "/loginValidate",method = RequestMethod.POST)
    public String loginValidate(@RequestParam("username") String username,@RequestParam("password") String password,HttpSession httpSession) {
        if(username==null || password==null){
            return "user/userLogin";}
        else {
            User user = userService.getUserByUsername(username);
            if(user.getPassword().equals(password)) {
                httpSession.setAttribute("username", username);
                return "/student/stuList";
            } else  {
                return "user/userLogin";
            }
        }
    }
    /**
     *
     * @param session
     * @return
     */
    @RequestMapping(value = "/yzmLogin",method = RequestMethod.POST)
    // 这个注解表示这个返回的不是某个页面，而是直接返回这个字符串的数据
    public  String yzmlogin(User user, HttpSession session){
        String sessionSmsCode = (String) session.getAttribute(user.getPhone());

        if(StringUtils.isNotEmpty(sessionSmsCode)){
            if(sessionSmsCode.equals(user.getSmsCode())){
                return "redirect:/student/stuList";
            }else{
                return "error";
            }
        }else{
            return "请先发送短信验证码！";
        }
    }

    /**
     * sendSmsCode
     * @param phone
     * @return
     */
    @RequestMapping(value = "/sendSmsCode", method = RequestMethod.POST)
    @ResponseBody
    public String sendSmsCode(String phone,HttpSession session){
        // 使用UUID来做验证码
        String yanzhengma = UUID.randomUUID().toString().toUpperCase().replaceAll("-", "").substring(0, 4);
        DefaultProfile profile = DefaultProfile.getProfile("cn-hangzhou", "LTAIAKoYShjngBpc", "fTBLFaTgKRNvRlWHjlCDoeRgTRaowF");
        IAcsClient client = new DefaultAcsClient(profile);
        CommonRequest request = new CommonRequest();
        request.setMethod(MethodType.POST);
        request.setDomain("dysmsapi.aliyuncs.com");
        request.setVersion("2017-05-25");
        request.setAction("SendSms");
        request.putQueryParameter("RegionId", "cn-hangzhou");
        request.putQueryParameter("PhoneNumbers", phone);
        request.putQueryParameter("SignName", "学生管理");
        request.putQueryParameter("TemplateCode", "SMS_171353709");
        request.putQueryParameter("TemplateParam", "{\"code\":\""+yanzhengma+"\"}");
        try {
            CommonResponse response = client.getCommonResponse(request);
            System.out.println(response.getData());
        } catch (ServerException e) {
            e.printStackTrace();
        } catch (ClientException e) {
            e.printStackTrace();
        }
        // 吧验证码存储到session中，当前用户的这次会话的域，下次用户请求可以从session里面再将这个值取出来进行判断
        session.setAttribute(phone, yanzhengma);
        return "success";
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpSession httpSession) {
        httpSession.removeAttribute("username");
        return "redirect:/user/login";
    }
    @RequestMapping(value = "/userChoose")
    public String userchoose(){
        return "user/userChoose";
    }
}