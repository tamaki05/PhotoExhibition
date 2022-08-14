// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.


import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
//= import "jquery_ujs";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"
//import "./about.js"
import "./slick.min.js"
import "./top.js"


Rails.start()
Turbolinks.start()
ActiveStorage.start()
//= require jquery
//= require rails-ujs
//= require_tree .

// console.log("application")
// $('.text-center').slick({
//   dots: true
// });

/*global $*/
document.addEventListener("turbolinks:load", function(){
$(function() {
    $('.slider').slick({
		autoplay: true,//自動的に動き出すか。初期値はfalse。
	  autoplaySpeed: 5000,
		infinite: true,//スライドをループさせるかどうか。初期値はtrue。
		slidesToShow: 3,//スライドを画面に3枚見せる
		slidesToScroll: 3,//1回のスクロールで3枚の写真を移動して見せる
		prevArrow: '<div class="slick-prev"></div>',//矢印部分PreviewのHTMLを変更
		nextArrow: '<div class="slick-next"></div>',//矢印部分NextのHTMLを変更
		arrows: true,
		dots: true,//下部ドットナビゲーションの表示
		responsive: [
			{
			breakpoint: 769,//モニターの横幅が769px以下の見せ方
			settings: {
				slidesToShow: 2,//スライドを画面に2枚見せる
				slidesToScroll: 2,//1回のスクロールで2枚の写真を移動して見せる
			}
		},
		{
			breakpoint: 426,//モニターの横幅が426px以下の見せ方
			settings: {
				slidesToShow: 1,//スライドを画面に1枚見せる
				slidesToScroll: 1,//1回のスクロールで1枚の写真を移動して見せる
			}
		}
	]
	});
});

});