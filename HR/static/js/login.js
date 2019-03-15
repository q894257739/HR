/**
 * Created by Administrator on 2016/9/29.
 */
$(function(){

    $('#update_code').click(function () {
        $.cookie('username',$('#username').val())
        $.cookie('password',$('#password').val())
    })

    $('#username').val(localStorage.getItem('username'))
    $('#password').val(localStorage.getItem('password'))

    console.log(localStorage.getItem('true'))
    if (localStorage.getItem('true') == '1'){
        $('#true').addClass('show')
        $('#true').attr('flag','true')
        $('#x_span').html('')
        localStorage.setItem('username',$('#username').val())
        localStorage.setItem('password',$('#password').val())
        localStorage.setItem('true','1')
    }

    $('#username').blur(function () {
        if ($(this).val().length<4 || $(this).val().length > 10){
            $(this).next().html('请输入4-10位的字符')
            $('#u_span').css('color','#e60000')
            $(this).css("border","1px solid #e60000")
        }else {
            $(this).next().html('')
        }
    })

    $('#text').blur(function () {
        if($(this).val() == ''){
            $('#v_span').html('验证码不能为空')
            $("#text").attr("flag","false");
        }else{
            $('#v_span').html('')
            $("#text").attr("flag","true");
        }
    })

    $('#true').click(function () {
        if($(this).hasClass('show')){
            $(this).removeClass('show')
            $(this).attr('flag','flase')
            localStorage.setItem('username','')
            localStorage.setItem('password','')
            localStorage.setItem('true','')

        }else {
            $(this).addClass('show')
            $(this).attr('flag','true')
            $('#x_span').html('')
            localStorage.setItem('username',$('#username').val())
            localStorage.setItem('password',$('#password').val())
            localStorage.setItem('true','1')
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
                            $.cookie('password','')
                            $('form').submit()
                        }
                    }
                })
            }else {
                $('#v_span').html(response.msg)
            }
        })
    })
});


