<?php

if ( ! defined( 'ABSPATH' ) ) {
    exit;
}
wp_reset_postdata();

global $post,$wpdb;


add_action('amp_post_template_css', function () {
    ob_start();
    ?>

    <style>
        .show {
            display: block;
        }

        .hide {
            display: none;
        }

        .checkmark {
            fill: #7291f9;
            width: 15px;
            height: 15px;
            display: inline;
            margin-left:5px;
        }

        .grid-layout {
            display: grid;
            grid-template-columns: 55% 45%;
        }

        .model-bg {
            background: #202020;
            width: 100%;
            margin: 0 auto;
            height: auto;
            padding: 30px
        }

        .model-bg .right-side {
            margin-left: 25px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .model-bg .profile-pic{
            position: absolute;
            bottom: 0;
        }

        .model-bg .profile-pic amp-img {
            width: 200px;
            height: 131px;
        }

        .model-bg .right-side .name {
            color: white;
            font-size: 28px;
            font-weight: bold;
        }

        .right-side .reviews {
            display: flex;
            margin-top: 25px;
        }

        .right-side .views {
            margin-left: 12px;
            text-align: center;
        }

        .right-side .rank {
            text-align: center;
        }

        .right-side .number {
            color: white;
            font-size: 20px
        }

        .right-side .text {
            color: #c1c1c1;
            font-size: 14px;
            margin-top: 5px
        }

        .right-side .features {
            margin-top: 30px;
            color: white;
            display: flex;
            flex-flow: wrap;
            margin-left: -10px
        }

        .right-side .features .item {
            border: 1px solid white;
            padding: 5px;
            border-radius: 5px;
        }

        .right-side .features .item:nth-child(n+1) {
            margin: 10px
        }

        .right-side .features .item:not(:last-child) {
            margin-right: 20px
        }

        .right-side .features .data-heading {
            font-size: 15px;
        }

        .right-side .features .data {
            font-size: 13px;
            margin-top: 5px;
            color: #c1c1c1;
        }

        .bio{
            margin-top:20px;
            color: #c1c1c1;
            font-size:14px
        }

        .model-videos{
            display: grid;
            grid-template-columns: 33% 33% 33%;
            margin-top:50px;
            gap:10px;
        }

        .channel-cover{
            position: relative;
        }

        .video-item amp-img{
            margin-bottom:8px
        }

        .pagination {
            text-align: center;
            margin-top: 15px;
        }

        .num {
            display: inline-block;
            padding: 5px 8px;
            border: 1px solid #333;
            border-radius: 5px;
        }

        .pagination a{
            color:black;
        }

        .pagination a:hover{
            text-decoration: none;
            color:white;
        }

        .pagination .num:hover{
            background: black;
        }

        .pagination .active{
            background: black;
            color: white;
        }

        .pagination .active:hover{
            background: white;
            color: black;
        }

        .nogay-hide-effect{
            background: none;
            color: white;
            border:none;
            font-size: 16px;
        }

        @media (max-width: 620px){
            .grid-layout{
                grid-template-columns: 100%;
            }
            .left-side{
                margin-bottom:15px;
            }

            .left-side .profile-pic amp-img{
                height: 100px;
                width: 150px
            }

            .model-videos{
                grid-template-columns: 100%;
            }

            .video-item{
                max-width: 100%;
            }

        }

    </style>

    <?php
    echo str_replace(['<style>', '</style>'], null, ob_get_clean());
});


$checkmark = '<svg class="checkmark" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 342.508 342.508" xml:space="preserve"> <g> <path d="M171.254,0C76.837,0,0.003,76.819,0.003,171.248c0,94.428,76.829,171.26,171.251,171.26 c94.438,0,171.251-76.826,171.251-171.26C342.505,76.819,265.697,0,171.254,0z M245.371,136.161l-89.69,89.69 c-2.693,2.69-6.242,4.048-9.758,4.048c-3.543,0-7.059-1.357-9.761-4.048l-39.007-39.007c-5.393-5.398-5.393-14.129,0-19.521 c5.392-5.392,14.123-5.392,19.516,0l29.252,29.262l79.944-79.948c5.381-5.386,14.111-5.386,19.504,0 C250.764,122.038,250.764,130.769,245.371,136.161z"/> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> </svg>';
$like = '<svg class="like_svg" style="width: 15px; height: 15px" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 512 512" xml:space="preserve"> <g> <g> <path d="M53.333,224C23.936,224,0,247.936,0,277.333V448c0,29.397,23.936,53.333,53.333,53.333h64 c12.011,0,23.061-4.053,32-10.795V224H53.333z"/> </g> </g> <g> <g> <path d="M512,304c0-12.821-5.077-24.768-13.888-33.579c9.963-10.901,15.04-25.515,13.653-40.725 c-2.496-27.115-26.923-48.363-55.637-48.363H324.352c6.528-19.819,16.981-56.149,16.981-85.333c0-46.272-39.317-85.333-64-85.333 c-22.165,0-37.995,12.48-38.677,12.992c-2.517,2.027-3.989,5.099-3.989,8.341v72.341l-61.44,133.099l-2.56,1.301v228.651 C188.032,475.584,210.005,480,224,480h195.819c23.232,0,43.563-15.659,48.341-37.269c2.453-11.115,1.024-22.315-3.861-32.043 c15.765-7.936,26.368-24.171,26.368-42.688c0-7.552-1.728-14.784-5.013-21.333C501.419,338.731,512,322.496,512,304z"/> </g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> </svg>';
$tv = '<svg class="tv" style="width: 15px; height:15px;" viewBox="0 0 511.929 511.929" xmlns="http://www.w3.org/2000/svg"><g><path d="m347.677 457.508c-96.305 3.048-193.902 1.25-290.082-5.346-17.966-1.227-32.527-15.056-34.622-32.884-10.631-90.388-10.631-182.05 0-272.438 2.095-17.828 16.656-31.657 34.623-32.883 8.647-.591 16.673-1.106 24.536-1.576 4.135-.247 7.287-3.799 7.04-7.934-.248-4.135-3.79-7.292-7.934-7.039-7.906.472-15.973.99-24.664 1.584-25.164 1.717-45.561 21.104-48.498 46.097-10.768 91.551-10.768 184.391 0 275.941 2.938 24.993 23.334 44.38 48.496 46.097 9.183.63 18.382 1.206 27.588 1.749.002.009.003.018.005.027l5.201 22.371c.805 3.463 3.89 5.803 7.299 5.803.562 0 1.133-.063 1.705-.196 4.035-.938 6.545-4.969 5.607-9.003l-4.216-18.135c52.05 2.787 104.388 4.205 156.607 4.205 30.666 0 61.292-.482 91.785-1.448 4.14-.131 7.39-3.593 7.259-7.733s-3.616-7.42-7.735-7.259z"/><path d="m503.853 145.088c-2.938-24.993-23.334-44.38-48.496-46.097-52.437-3.593-105.201-5.748-157.982-6.497l56.154-65.248c2.702-3.14 2.348-7.875-.792-10.577s-7.875-2.347-10.577.792l-64.389 74.817c-13.812-.104-27.621-.113-41.424-.022l-64.368-74.795c-2.703-3.139-7.438-3.495-10.577-.792-3.14 2.702-3.495 7.438-.792 10.577l56.112 65.201c-35.255.47-70.446 1.571-105.48 3.316-4.137.206-7.324 3.727-7.118 7.864s3.734 7.323 7.864 7.117c113.528-5.656 228.708-4.576 342.346 3.212 17.966 1.226 32.526 15.055 34.623 32.883 10.631 90.388 10.631 182.05 0 272.438-2.097 17.828-16.657 31.657-34.627 32.883-25.428 1.749-51.341 3.182-77.02 4.259-4.139.173-7.353 3.669-7.179 7.808.169 4.032 3.49 7.186 7.487 7.186.106 0 .214-.002.32-.006 11.384-.478 22.812-1.037 34.226-1.65l-4.212 18.119c-.938 4.035 1.573 8.065 5.607 9.003.571.133 1.143.196 1.705.196 3.409 0 6.493-2.34 7.299-5.803l5.2-22.371c.002-.01.003-.019.005-.029 9.232-.546 18.445-1.118 27.586-1.747 25.164-1.717 45.561-21.104 48.498-46.097 10.77-91.549 10.77-184.39.001-275.94z"/><path d="m48.079 164.6c-10.369 78.604-10.369 158.313 0 236.917 2.119 16.062 15.411 28.53 31.605 29.648 58.485 4.037 117.383 6.056 176.28 6.056s117.795-2.019 176.28-6.056c16.195-1.118 29.487-13.587 31.605-29.648 10.369-78.604 10.369-158.313 0-236.917-2.118-16.062-15.41-28.531-31.605-29.648-116.971-8.074-235.59-8.074-352.561 0-16.194 1.118-29.486 13.587-31.604 29.648zm207.885-20.704c58.552 0 117.104 2.007 175.247 6.02 9.106.629 16.578 7.629 17.768 16.646 10.197 77.301 10.197 155.692 0 232.994-1.189 9.016-8.661 16.017-17.768 16.645-116.286 8.027-234.209 8.027-350.494 0-9.106-.628-16.578-7.629-17.768-16.646-10.197-77.301-10.197-155.692 0-232.993 1.189-9.017 8.662-16.017 17.768-16.646 58.143-4.013 116.695-6.02 175.247-6.02z"/></g></svg>';

global $redux_builder_amp; ?>
<?php amp_header(); ?>

    <div class="cntr b-w" style="max-width:990px; margin:0 auto;">
        <div class="hmp">

            <div class="model-info">

                <?php

                $ide = $wpdb->get_results("SELECT {$wpdb->prefix}postmeta.post_id FROM {$wpdb->prefix}postmeta JOIN {$wpdb->prefix}posts ON {$wpdb->prefix}posts.ID = {$wpdb->prefix}postmeta.post_id WHERE INSTR({$wpdb->prefix}postmeta.meta_value, $post->ID) > 0 AND {$wpdb->prefix}postmeta.meta_key = 'secili_kanal' AND {$wpdb->prefix}posts.post_status = 'publish'", ARRAY_A);
                $viewss = [];
                foreach ($ide as $id) {
                    $viewss[] = get_post_meta($id['post_id'], 'views', true);
                }

                $vid_count = count($viewss); //modelin oynadığı toplam video sayısı

                $viewss = array_sum($viewss); //modelin oynadığı videoların izlenme sayısı toplamı

                $viewss = ($viewss * _multi()); //modelin oynadığı videoların izlenme sayısı toplamının şişirilmişi

                $pid = $post->ID;

                $sql = "SELECT ID FROM {$wpdb->prefix}posts WHERE post_type = 'kanal' AND post_status = 'publish'";
                $result = $wpdb->get_results($sql, ARRAY_A);
                $arr_ceil = [];
                foreach ($result ?? [] as $val):
                    $pid = $val['ID'];
                    $all_ids = $wpdb->get_results("SELECT {$wpdb->prefix}postmeta.post_id FROM {$wpdb->prefix}postmeta JOIN {$wpdb->prefix}posts ON {$wpdb->prefix}posts.ID = {$wpdb->prefix}postmeta.post_id WHERE INSTR({$wpdb->prefix}postmeta.meta_value, $pid) > 0 AND {$wpdb->prefix}postmeta.meta_key = 'secili_kanal' AND {$wpdb->prefix}posts.post_status = 'publish'", ARRAY_N);
                    $new_ids = [];
                    $izlenme = [];

                    foreach ($all_ids ?? [] as $ids) {
                        array_push($new_ids, $ids[0]);
                        array_push($izlenme, get_post_meta($ids[0], 'views', true));
                    }

                    $arr_ceil[] = [
                        array_sum($izlenme),
                        'pid' => $pid,
                        'oynadigi_videolar' => $new_ids
                    ];

                endforeach;

                rsort($arr_ceil);

                $i = 0;
                while ($i <= count($arr_ceil)) {
                    unset($arr_ceil[$i][0]);
                    unset($arr_ceil[$i]['oynadigi_videolar']);


                    $i++;
                }

                $models = [];
                foreach ($arr_ceil ?? [] as $item) {
                    $models[] = $item['pid'];
                }


                global $post;
                $models = array_flip($models);
                $qwe = $post->ID;
                $current_num = $models[$qwe] + 1;


                ?>

                <div class="model-bg">

                    <div class="grid-layout">
                        <div class="left-side">
                            <div class="channel-cover">
                                <?php if ($channel_photo = get_post_meta($qwe, 'kanal_kapak_fotografi', true)): ?>
                                    <amp-img
                                        layout="responsive"
                                        alt="<?php echo get_the_title() ?> Cover photo"
                                        src="<?php echo $channel_photo ?>"
                                        width="350"
                                        height="200"
                                    >
                                    </amp-img>
                                <?php endif ?>
                                <div class="profile-pic">
                                    <amp-img alt="<?php echo get_the_title() ?> profile photo"
                                             src="<?php echo !empty(get_the_post_thumbnail_url(null, 'full')) ? get_the_post_thumbnail_url(null, 'full') : 'https://cdn.shopify.com/s/files/1/0533/2089/files/placeholder-images-image_large.png?format=jpg&quality=90&v=1530129081' ?>"
                                             width="150"
                                             height="200"
                                             layout="responsive">
                                    </amp-img>
                                </div>
                            </div>

                        </div>
                        <div class="right-side">
                            <h1 class="name"><?php echo get_the_title() ?><?php echo $checkmark ?></h1>
                            <div class="reviews">
                                <div class="rank">
                                    <div class="number"><?php echo $current_num ?>.</div>
                                    <div class="text">Sıra</div>
                                </div>
                                <div class="views">
                                    <div class="number"><?php echo number_format_i18n($viewss); ?></div>
                                    <div class="text">İzlenme</div>
                                </div>
                                <div class="views">
                                    <div class="number"><?php echo $vid_count; ?></div>
                                    <div class="text">Video</div>
                                </div>
                            </div>
                            <?php $features = get_field('model_bilgileri', $post->ID); ?>
                            <?php if (!empty($features)): ?>
                                <div class="features">
                                    <?php foreach ((array)$features as $feature): ?>
                                        <div class="item">
                                            <div class="data-heading"><?php echo $feature['nitelik_ismi'] ?></div>
                                            <div class="data"><?php echo $feature['nitelik_degeri'] ?></div>
                                        </div>
                                    <?php endforeach ?>
                                </div>
                            <?php endif ?>
                            <div class="bio">
                                <div style="font-size:15px; font-weight: bold; margin-bottom:12px">
                                    Kanal Hakkında
                                </div>
                                <div style="text-align: justify; ">
                                    <?php
                                    global $post;
                                    $content = strip_tags(get_the_content($post->ID), '<strong><a><p><ol><li><ul><span><div>');
                                    $first = substr($content, 0, 150);
                                    $second = substr($content, 150, strlen($content));
                                    echo $first;
                                    ?>
                                    <p [class]="visible ? 'show' : 'hide'" class="hide"><?php echo $second ?></p>
                                    <div style="text-align:center;">
                                        <?php if (!empty($second)): ?>
                                            <button class="effect01 btn nogay-hide-effect"
                                                    [text]="visible ? 'Gizle' : 'Devamını Oku'"
                                                    on="tap:AMP.setState({visible: !visible})">
                                                <span>Devamını Oku</span>
                                            </button>
                                        <?php endif ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>

            </div>

            <div class="model-videos">
                <?php


                $paged = explode( '/', $_SERVER['REQUEST_URI'] );
                $paged = array_filter( $paged );
                $paged = (int) end( $paged );
                $paged = $paged == 0 ? 1 : $paged;
                $paged = is_numeric( $paged ) ? $paged : 1;
                $minus = 12;

                $postid = $post->ID;
                $pref   = $wpdb->prefix;

                $sql = "SELECT {$pref}posts.ID FROM {$pref}posts INNER JOIN 
                        {$pref}postmeta ON {$pref}posts.ID = {$pref}postmeta.post_id WHERE 
                        {$pref}posts.post_type = 'post' AND 
                        {$pref}posts.post_status = 'publish' AND 
                        {$pref}postmeta.meta_key = 'secili_kanal' AND
                        {$pref}postmeta.meta_value LIKE '%" . $postid . "%'
                        ORDER BY {$pref}posts.ID DESC
                        ";


                $yur    = ( ceil( $paged == 1 ? $minus : $paged * $minus ) - $minus );
                $postsq = $wpdb->get_results( $sql, ARRAY_A );
                $posts  = array_slice( $postsq, $yur, $minus );

                if ( $posts ):
                    foreach ( $posts as $post ):
                        $post = $post['ID'];
                        setup_postdata( $post );
                        ?>
                        <div class="video-item">
                            <a style="color:black" href="<?php echo rtrim( get_the_permalink(), '/' ) . '/amp/' ?>">
                                <amp-img
                                    alt="<?php echo get_the_title() ?>"
                                    src="<?php echo get_the_post_thumbnail_url() ?>"
                                    layout="responsive"
                                    height="220"
                                    width="400">
                                </amp-img>
                            </a>
                            <div class="video-details" style="font-size:13px;">
	                        <span style="font-weight: bold">
                                <a style="color:black" href="<?php echo rtrim( get_the_permalink(), '/' ) . '/amp/' ?>">
                                    <?php echo get_the_title() ?>
                                </a>
                            </span>
                                <div style="font-size:12px;">
                                    <?php

                                    $meta_models = json_decode(get_post_meta($post, 'secili_model', true));
                                    if($meta_models):
                                        foreach($meta_models as $models):
                                            echo $checkmark ?>
                                            <a href="<?php echo get_the_permalink($models) ?>amp/"><?php echo get_the_title($models) ?></a>
                                        <?php
                                        endforeach;
                                    endif;

                                    ?>
                                </div>
                                <div class="view">
                                    <?php echo number_format( ( get_post_meta( get_the_ID(), 'views', true ) ) * _multi() ) ?>
                                    İzlenme
                                    <?php echo $like ?> <?php echo number_format( ( get_post_meta( get_the_ID(), 'likes', true ) ) * _multi() ) ?>
                                </div>
                            </div>

                        </div>
                    <?php
                    endforeach;
                endif;
                wp_reset_postdata();
                wp_reset_query();
                ?>
            </div>

            <div class="pagination">

                <?php

                $page_wh = ceil( ( count( $postsq ) / $minus ) );
                $i       = 1;
                while ( $i <= $page_wh ) {
                    ?>
                    <a href="<?php echo get_the_permalink() ?>amp/page/<?php echo $i; ?>/">
                        <div class="num <?php echo $paged == $i ? 'active' : '' ?>">
                            <?php echo $i; ?>
                        </div>
                    </a>
                    <?php
                    $i ++;
                }
                ?>

            </div>

        </div>
    </div>

<?php amp_footer(); ?>
