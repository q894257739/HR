/**
 * Created by Administrator on 2016/10/11.
 */
$(function () {

    if ($('.all_goods').text() == '0') {
        $($('#only_pay')).hide()
    }

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
            total()
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
                total()
            })
        })

    })

    $('#delall').click(function () {
        $.get('/delall/', function (response) {
            if (response.status == 1) {
                $('.ll .merchantHeader').empty()
                $('.del_msg').show()
                $('.all_goods').text(0)
                $('#now_num').text(0)
                $('#only_pay').hide()
                total()
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
                $that.parent().parent().empty()
                $('#now_num').text($('#now_num').text() - 1)
                $('.all_goods').text($('.all_goods').text() - 1)
                total()
                if ($('.all_goods').text() == '0') {
                    $($('#only_pay')).hide()
                }
            }
        })
    })

    function total() {
        var sum = 0
        var count_num = 0
        $('.ll .merchantHeader').each(function () {
            var $prive = $(this).find('#top_price').attr('data-price')
            var $num = $(this).find('#top_num').attr('data-num')

            if ($(this).find('i').hasClass('found')) {
                sum = parseInt($prive) * parseInt($num)
                count_num += sum
                $(this).find('#top_total').html(sum)
            } else {
                $(this).find('#top_total').html(0)
            }

        })

        $('#count_num').html(count_num)
    }


    function choose_goodsnum() {
        var num = $('.found').length
        $('#now_num').text(num)
    }

    $('#only_pay').click(function () {
        $.get('/generateorder/', function (response) {
            if (response.status == 1) {
                window.open('/orderdetail/', '_self')
            }
        })
    })

    $('.add').click(function () {
        $that = $(this)
        var $number = parseInt($(this).prev().text())
        request_data = {
            'cartid': $(this).attr('data-cartid')
        }

        $.get('/addcartgoods/', request_data, function (response) {
            if (response.status == 1) {
                $number += 1
                $that.prev().text($number)
                $that.parent().parent().attr('data-num', $number)
                total()
            }


        })


    })

    $('.less').click(function () {
        $that = $(this)
        var $number = parseInt($(this).next().text())
        request_data = {
            'cartid': $(this).attr('data-cartid')
        }

        $.get('/reducecartgoods/', request_data, function (response) {
            if (response.status == 1) {
                $number -= 1
                if ($number < 1) {
                    $number = 1
                }
                $that.next().text($number)
                $that.parent().parent().attr('data-num', $number)
                total()
            }


        })

    })

})