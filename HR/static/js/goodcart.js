/**
 * Created by Administrator on 2016/10/11.
 */
$(function () {

    total()

    choose_goodsnum()

    $('.ll .merchantHeader i').click(function () {
        $that = $(this)
        request_data = {
            'goods_id': $(this).attr('goods_id')
        }

        $.get('/changeselect/', request_data, function (response) {
            if (response.isselect == 1) {
                $that.addClass('found')
            } else {
                $that.removeClass('found')
            }

            choose_goodsnum()
        })

    })

    $('.jiesuan .float_l i').click(function () {
        var $isall = $('.float_l').attr('all')
        $isall = ($isall == 'false') ? true : false
        $('.float_l').attr('all', $isall)

        if ($isall) {
            $(this).addClass('found_all')
        } else {
            $(this).removeClass('found_all')
        }

        request_data = {
            'isall': $isall
        }

        $.get('/changeall/', request_data, function (response) {
            $('.ll .merchantHeader i').each(function () {
                if ($isall) {
                    $(this).addClass('found')
                } else {
                    $(this).removeClass('found')
                }

                choose_goodsnum()
            })
        })
    })

    $('#delall').click(function () {
        $.get('/delall/', function (response) {
            if (response.status == 1) {
                $('.ll .merchantHeader').hide()
                $('.del_msg').show()
                $('.all_goods').text(0)
                $('#now_num').text(0)
            }
        })
    })

    $('.top_del').click(function () {
        $that = $(this)
        request_data = {
            'cart_id': $(this).attr('cart_id')
        }

        $.get('/delone/', request_data, function (response) {
            if (response.status == 1) {
                $that.parent().parent().hide()
                $('#now_num').text($('#now_num').text() - 1)
            }
        })
    })

    function total() {
        var sum = 0
        var count_num = 0
        $('.ll .merchantHeader').each(function () {
            var $prive = $(this).find('#top_price').attr('data-price')
            var $num = $(this).find('#top_num').attr('data-num')
            
            if($(this).hasClass('found')){
                console.log(1)
                sum = parseInt($prive) * parseInt($num)
                count_num += sum
                $(this).find('#top_total').html(sum)
            }
        })
        $('#count_num').html(count_num)
    }


    function choose_goodsnum() {
        var num = $('.found').length
        $('#now_num').text(num)
    }


    total()
});