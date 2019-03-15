/**
 * Created by Administrator on 2016/9/29.
 */
$(function(){
    //按钮
    // $('.btn').hover(function(){
    //     $(this).css("border","1px solid #e60000").css("text-decoration","underline")
    // },function(){
    //     $(this).css("border","1px solid #d1d1d1").css("text-decoration","none")
    // });

    //表单验证

    $("#phoneNum").attr("flag","false");
    $("#text").attr("flag","false");
    $("#phoneText").attr("flag","false");
    $("#password").attr("flag","false");
    $("#a_password").attr("flag","false");

    $("#username").val($.cookie('username'))
    $("#phoneNum").val($.cookie('phoneNum'))
    $("#text").val($.cookie('text'))
    $("#password").val($.cookie('password'))
    $("#a_password").val($.cookie('a_password'))


    $('#update_code').click(function () {
        $.cookie('username',$('#username').val())
        $.cookie('phoneNum',$("#phoneNum").val())
        $.cookie('text',$('#text').val())
        $.cookie('password',$('#password').val())
        $.cookie('a_password',$('#a_password').val())


    })

    $('#username').blur(function () {
        if ($(this).val().length<4 || $(this).val().length > 10){
            $(this).next().html('请输入4-10位的字符')
            $('#u_span').css('color','#e60000')
            $(this).css("border","1px solid #e60000")
        }else {
            var $that = $(this)
            request_data = {
                'username':$(this).val()
            }
            $.get('/checkusername/',request_data,function (response) {
                if (response.status == 1){
                    $that.next().html(response.msg)
                    $('#u_span').css('color','green')
                    $("#username").attr("flag","ture");
                    $("#username").css("border","1px solid #dadada")
                }else{
                    $that.next().html(response.msg)
                    $('#u_span').css('color','#e60000')
                    $("#username").attr("flag","flase");
                }
            })
        }
    })

    $("#phoneNum").blur(function(){
       if($('#phoneNum').val()){
           var regEx = /^1(3|4|5|7|8)\d{9}$/;
           if(regEx.test($('#phoneNum').val())){
               $(this).next().html('手机号正确');
               $('#p_span').css('color','green')
               $(this).css("border","1px solid #dadada")
           }else {
               $('#p_span').css('color','#e60000')
               $(this).next().html("请正确填写您的手机号码");
               $(this).css("border","1px solid #e60000")
           }
       }else{
           $(this).next().html('手机号码不能为空');
           $('#p_span').css('color','#e60000')
       }
    });

    $('#text').blur(function () {
        if($(this).val() == ''){
            $('#v_span').html('验证码不能为空')
            $("#text").attr("flag","false");
        }else{
            $('#v_span').html('')
            $("#text").attr("flag","true");
        }
    })


    $('#password').blur(function () {
        if($(this).val().length < 6 || $(this).val().length > 16){
            $('#pass_span').html('请输入6-16位字符')
            $("#phoneText").attr("flag","false");
        }else{
            $('#pass_span').html('')
            $("#phoneText").attr("flag","true");
        }
    })

    $('#a_password').blur(function () {
        var f_pass =   $('#password').val()
        var l_pass = $(this).val()

        if (f_pass == l_pass){
            console.log(f_pass,l_pass)
            $('#a_span').html('')
            $("#password").attr("flag","true");
        }else {
            $('#a_span').html('两次密码不一致')
            $("#password").attr("flag","false");
        }
    })


    $('#true').click(function () {
        if($(this).hasClass('show')){
            $(this).removeClass('show')
            $(this).attr('flag','flase')
        }else {
            $(this).addClass('show')
            $(this).attr('flag','true')
            $('#x_span').html('')
        }
    })

    $('#submit').click(function () {
        request_data = {
            'verifycode':$('#text').val()
        }

        $.get('/checkverifycode/',request_data,function (response) {
            if(response.status == 1){
                var isregister = true

                $('form input').each(function () {
                    if($(this).attr('flag') == 'flase'){
                        isregister = false
                    }

                    if(isregister){
                        if($('#true').attr('flag') == 'true'){

                            $.cookie('username','')
                            $.cookie('phoneNum','')
                            $.cookie('text','')
                            $.cookie('password','')
                            $.cookie('a_password','')

                            $('form').submit()
                        }else {
                            $('#x_span').html('还没看协议就想注册？？？')
                        }
                    }
                })
            }else {
                $('#v_span').html(response.msg)
            }
        })
    })
});