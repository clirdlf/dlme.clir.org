!function(){function n(n){n=n||window.event,n.preventDefault&&n.preventDefault(),n.returnValue=!1}function e(e){for(var o=w.length;o--;)if(e.keyCode===w[o])return void n(e)}function o(e){n(e)}function t(n){}function i(){window.onmousewheel=document.onmousewheel=t,document.onkeydown=e,document.body.ontouchmove=o}function r(){window.onmousewheel=document.onmousewheel=document.onkeydown=document.body.ontouchmove=null}function d(){return window.pageYOffset||v.scrollTop}function u(){if(s=d(),a&&!m){if(s<0)return!1;window.scrollTo(0,0)}return classie.has(y,"notrans")?(classie.remove(y,"notrans"),!1):!l&&void(s<=0&&f?c(0):s>0&&!f&&c(1))}function c(n){l=!0,n?classie.add(y,"modify"):(a=!0,i(),classie.remove(y,"modify")),setTimeout(function(){f=!f,l=!1,n&&(a=!1,r())},1e3)}$(".story-menu").click(function(){var n=$(this).find("a").attr("href");console.log("element",n)});var s,f,a,l,m=function(){var n=-1,e=window.navigator.userAgent,o=e.indexOf("MSIE "),t=e.indexOf("Trident/");if(o>0)n=parseInt(e.substring(o+5,e.indexOf(".",o)),10);else if(t>0){var i=e.indexOf("rv:");n=parseInt(e.substring(i+3,e.indexOf(".",i)),10)}return n>-1?n:void 0}(),w=[32,37,38,39,40],v=window.document.documentElement,y=document.getElementById("container"),g=y.querySelector("button.trigger"),h=d();a=0===h,i(),h&&(f=!0,classie.add(y,"notrans"),classie.add(y,"modify")),window.addEventListener("scroll",u),g.addEventListener("click",function(){c("reveal")})}();