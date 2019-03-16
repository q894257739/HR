/**
 * Created by Administrator on 2016/10/11.
 */
$(function () {
    $('.ll .merchantHeader i').click(function () {
        $that = $(this)

        request_data = {
            'goods_id': $(this).attr('goods_id')
        }

        $.get('/changeselect/', request_data, function (response) {
            if (response.isselect == 1) {
                $that.addClass('ctl')

            } else {
                $that.removeClass('ctl')
            }
        })
    })

    $('.jiesuan .float_l i').click(function () {
        console.log($('.float_l').attr('all'))
        var $isall = $('.float_l').attr('all')
        $isall = ($isall == 'false') ? true : false
        $('.float_l').attr('all',$isall)

        console.log($isall)

        if ($isall) {
            $(this).addClass('ctl')
        } else {
            $(this).removeClass('ctl')
        }
        
        request_data = {
            'isall':$isall
        }
        
        $.get('/changeall/',request_data,function (response) {
            $('.ll .merchantHeader i').each(function () {
                if($isall){
                    $(this).addClass('ctl')
                }else {
                    $(this).removeClass('ctl')
                }
        })
            })


    })

    function total() {
        var sum = 0
        var count_num = 0
        $('.ll .merchantHeader').each(function () {
            var $prive = $(this).find('#top_price').attr('data-price')
            var $num = $(this).find('#top_num').attr('data-num')

            sum = parseInt($prive) * parseInt($num)

            count_num += sum

            $(this).find('#top_total').html(sum)
        })
        $('#count_num').html(count_num)
    }

    total()
});