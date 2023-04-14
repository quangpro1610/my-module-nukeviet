jQuery(document).ready(function($) {
    // Mở menu mobile
    $('.bton-toggle').on('click', function() {
        //$('body').prepend('<div class="mobile-menu-wrap"></div>');
        $('body').prepend('<div class="mobile-menu-bg"></div>');
        $('body').addClass('open-menu');
    });

    // Đóng menu mobile
    $('body').delegate('.mobile-menu-bg','click', function() {
        $('body').removeClass('open-menu');
        //$('.custom_menu_all .show_menu').removeClass('animate');
        $('.mobile-menu-bg').remove();
    });
    $('.show_menu').addClass('animate');
    $('.show_sub').on('click', function() {
        $(this).parents('li').find('.sub_menu').slideToggle();
    });
});