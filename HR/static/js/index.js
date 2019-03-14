/**
 * Created by Administrator on 2016/9/28.
 */
$(function(){
    //登录
    var href = location.href;
    if (href.split("?")[1]){
        var useName = href.split("?")[1].split("=")[1];
        if (useName){
            $("#user").html(useName)
        }
    }


    var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        paginationClickable: true,
        spaceBetween: 30,
        centeredSlides: true,
        autoplay: 2500,
        autoplayDisableOnInteraction: false
    });



    //楼梯
    $('.nav_lift').find("li").mouseenter(function(){
        $(this).find('.topyc').css("display","none");
        $(this).find('.topxs').css("display","block");
    });
    $('.nav_lift').find('li').mouseleave(function(){
        $(this).find('.topyc').css("display","block");
        $(this).find('.topxs').css("display","none");
    });
    $('.nav_lift').find("li").eq(0).unbind();
    $('.louti').find('a').click(function(){
        return false
    });

    $(window).scroll(function(){
        var currentTop = $(this).scrollTop();
        if( currentTop>=300 ){
            $(".louti").show();
            $('.cart').show();
        }else {
            $(".louti").hide();
            $('.cart').hide();
        }
        $('.center_body').children('div').each(function(index,ele){
            if(currentTop>=$(this).offset().top-80 &&  currentTop<= $(this).offset().top + $(this).outerHeight()/2){
                $('.louti').find('li').find('.topyc').css("display","block");
                $('.louti').find('li').find('.topxs').css("display","none");
                $('.louti').find("li").mouseenter(function(){
                    $(this).find('.topyc').css("display","none");
                    $(this).find('.topxs').css("display","block");
                });
                $('.louti').find('li').mouseleave(function(){
                    $(this).find('.topyc').css("display","block");
                    $(this).find('.topxs').css("display","none");
                });
                $('.louti').find('li').eq(index).find('.topyc').css("display","none");
                $('.louti').find('li').eq(index).find('.topxs').css("display","block");
                $('.louti').find('li').eq(index).unbind();
            }
        });
    });
    $('.louti').find('li').find('a').click(function(){
        $("body").stop();
        $("body").animate({
            scrollTop:$('.center_body').children('div').eq($(this).parent().index()).offset().top
        },function(){
            $('.louti').find('li').find('.topyc').css("display","block");
            $('.louti').find('li').find('.topxs').css("display","none");
            $(this).parent().find('.topyc').css("display","none");
            $(this).parent().find('.topxs').css("display","block");
        });
    });

    //右楼梯
    $('.cartLayer').find('li').eq(2).mouseenter(function(){
        $(this).css('background','url("../images/14840050.png") no-repeat -50px -50px')
    });
    $('.cartLayer').find('li').eq(2).mouseleave(function(){
        $(this).css('background','url("../images/14840050.png") no-repeat 0 -50px')
    });
    $('.cartLayer').find('li').eq(3).mouseenter(function(){
        $(this).css('background','url("../images/14840050.png") no-repeat -50px -100px')
    });
    $('.cartLayer').find('li').eq(3).mouseleave(function(){
        $(this).css('background','url("../images/14840050.png") no-repeat 0 -100px')
    });
    $('.cartLayer').find('li').eq(3).click(function(){
        $("body").animate({
            scrollTop:0
        },500);
    });
    $('.cartLayer').find('li').eq(3).click(function(){
        return false
    });


    //列表菜单
    var listBtn = $(".head_body_nav_list_ul").find("li");
    for(var i=2;i<listBtn.length;i++){
        listBtn.eq(i).mouseenter(function(){
            $('.head_body_nav_list_ul').find('.nav_c_list').hide();
            $('.nav_c_list').eq($(this).index()-2).show();
            $('.nav_c_list').eq($(this).index()-2).mousemove(function(){
                $(this).show();
            });
            $('.nav_c_list').eq($(this).index()-2).mouseout(function(){
                $(this).hide();
            });
        });
        listBtn.eq(i).mouseleave(function(){
            $('.nav_c_list').eq($(this).index()-2).hide();
        })
    }


    //按钮渐变
    $('.listTags').find('a').mouseenter(function(){
        $(this).css({"background":"#fff", "color":"black"})
    });
    $('.listTags').find('a').mouseleave(function(){
        $(this).css({"background":"", "color":"#fff"})
    });


    //商品特效
    function goods(){
        //边框渐变
        $('.mask').mouseenter(function(){
            $(this).css("border","1px solid #e60000");
        }).mouseleave(function(){
            $(this).css("border","1px solid #ededed")
        });

        //按钮渐变
        $(".btn_box").mouseenter(function(){
            $(this).find("a").css("background","#e60000");
            $(this).find("a").css("color","#fff")
        }).mouseleave(function(){
            $(this).find("a").css("background","#fff");
            $(this).find("a").css("color","#e60000")
        });

        //加入购物车
        $('.btn_box').click(function(){
            //显示提示
            $(this).find('.s_join').css("display","block");
            var self = $(this);
            var timer = setTimeout(function(){
                self.find('.s_join').css("display","none");
            },3000);

            return false
        })
    }

});