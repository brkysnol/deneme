            <?php

            $ide = $wpdb->get_results("SELECT {$wpdb->prefix}postmeta.post_id FROM {$wpdb->prefix}postmeta JOIN {$wpdb->prefix}posts ON {$wpdb->prefix}posts.ID = {$wpdb->prefix}postmeta.post_id WHERE INSTR({$wpdb->prefix}postmeta.meta_value, $post->ID) > 0 AND {$wpdb->prefix}postmeta.meta_key = 'secili_model' AND {$wpdb->prefix}posts.post_status = 'publish'", ARRAY_A);
            $viewss = [];
            foreach ($ide as $id) {
                $viewss[] = get_post_meta($id['post_id'], 'views', true);
            }

            $vid_count = count($viewss); //modelin oynadığı toplam video sayısı

            $viewss = array_sum($viewss); //modelin oynadığı videoların izlenme sayısı toplamı

            $viewss = ($viewss * _multi()); //modelin oynadığı videoların izlenme sayısı toplamının şişirilmişi

            $pid = $post->ID;

            $sql = "SELECT ID FROM {$wpdb->prefix}posts WHERE post_type = 'model' AND post_status = 'publish'";
            $result = $wpdb->get_results($sql, ARRAY_A);
            $arr_ceil = [];
            foreach ($result ?? [] as $val):
                $pid = $val['ID'];
                $all_ids = $wpdb->get_results("SELECT {$wpdb->prefix}postmeta.post_id FROM {$wpdb->prefix}postmeta JOIN {$wpdb->prefix}posts ON {$wpdb->prefix}posts.ID = {$wpdb->prefix}postmeta.post_id WHERE INSTR({$wpdb->prefix}postmeta.meta_value, $pid) > 0 AND {$wpdb->prefix}postmeta.meta_key = 'secili_model' AND {$wpdb->prefix}posts.post_status = 'publish'", ARRAY_N);
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
                        <div class="profile-pic">
                            <amp-img alt="<?php echo get_the_title() ?> profile photo"
                                     src="<?php echo !empty(get_the_post_thumbnail_url(null, 'full')) ? get_the_post_thumbnail_url(null, 'full') : 'https://cdn.shopify.com/s/files/1/0533/2089/files/placeholder-images-image_large.png?format=jpg&quality=90&v=1530129081' ?>"
                                     width="150"
                                     height="200"
                                     layout="responsive">
                            </amp-img>
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
                        </div>
                        <div class="see-videos">
                            <a href="#videos">
                                <span class="animation">
                                    Videoları Gör ↓↓
                                </span>
                            </a>
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
                    </div>
                </div>

                <div class="bio">
                    <div style="font-size:18px; font-weight: bold; margin-bottom:12px">
                        Biyografi
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
