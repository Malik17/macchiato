/*=================================================
true = enable
false = disable
1000 = 1 second

*** each var must have ; at the end of the line ***
=================================================*/

/*=================================================
preloader
=================================================*/

var __preloaderFadeOut = 1200; // fadeout
var __preloaderDelay = 800; // delay

/*=================================================
init config
=================================================*/

var __navigationToggle = true; // side nav toggle
var __recordHistory = false; // browser's history
var __scrollingSpeed = 800; // page scroll speed

/*=================================================
background style, set only one of below to true
=================================================*/

var __staticBackground = false; // set background image by css
var __videoHeader = true; // video background toggle
var __slideshowHeader = false; // image background toggle

/*=================================================
overlay
=================================================*/

var __overlay = true; // overlay

/*=================================================
youtube video background
=================================================*/

var __youtubeUrl = 'http://youtu.be/YJ4f5Gnl_rg'; // youtube video url
var __videoStartTime = 1; // video start time, 70 mean 70 seconds
var __videoEndTime = 0; // video end time, 180 mean 180 seconds, 0 mean play to end
var __videoMute = true; // mute video on start

/*=================================================
slideshow background
=================================================*/

var __imageNumber = 1; // how many slideshow image to show, 1 for static image background
var __slideshowStatic = false; // true for fade effect slideshow, false for css3 effect slideshow
var __slideshowShuffle = false; // random image
var __slideshowDelay = 8000; // slideshow delay
var __slideshowTransitionDuration = 2500; // transition duration
var __slideshowAnimationDuration = 12000; // animation duration, __slideshowDelay + 2000 for better fadeout timing
var __slideshowAnimationSet = [ // animation effect set
        'kenburnsUp',
        'kenburnsDown',
        'kenburnsLeft',
        'kenburnsRight'
      ];
var __slideshowTransitionSet = [ // transition effect set
        'fade'
      ];

/*=================================================
countdown
=================================================*/

var __countdown = true; // countdown toggle
var __countdownDate = '07/03/2015 17:59:59'; // countdown date
var __countdownTimezone = '+2'; // timezone

/*=================================================
progress bar
=================================================*/

var __progressBarSpeed = 2000; // progress bar speed


/*=================================================
***do not edit below code***
=================================================*/

if (__slideshowStatic) {
  var __slideshowAnimation = '';
  var __slideshowTransition = 'fade';
} else {
  var __slideshowAnimation = __slideshowAnimationSet;
  var __slideshowTransition = __slideshowTransitionSet;
}
