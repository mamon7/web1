
<html>

    <head>

        <title>Page Title</title>
<meta charset="utf-8">
    </head>
    <Script>
// Set the number of snowflakes (more than 30 - 40 not recommended)
var snowmax=50

// Set the colors for the snow. Add as many colors as you like
var snowcolor=new Array("#aaaacc","#ddddFF","#7979B3")

// Set the fonts, that create the snowflakes. Add as many fonts as you like
var snowtype=new Array("Arial Black","Arial Narrow","Times","Comic Sans MS")

// Set the letter that creates your snowflake (recommended:*)
var snowletter="🌸"

// Set the speed of sinking (recommended values range from 0.3 to 2)
var sinkspeed=0.6

// Set the maximal-size of your snowflaxes
var snowmaxsize=50

// Set the minimal-size of your snowflaxes
var snowminsize=35

// Set the snowing-zone
// Set 1 for all-over-snowing, set 2 for left-side-snowing
// Set 3 for center-snowing, set 4 for right-side-snowing
var snowingzone=1

var snow=new Array()
var marginbottom
var marginright
var timer
var i_snow=0
var x_mv=new Array();
var crds=new Array();
var lftrght=new Array();
var browserinfos=navigator.userAgent
var ie5=document.all&&document.getElementById&&!browserinfos.match(/Opera/)
var ns6=document.getElementById&&!document.all
var opera=browserinfos.match(/Opera/)
var browserok=ie5||ns6||opera

function randommaker(range) {
    rand=Math.floor(range*Math.random())
    return rand
}

function initsnow() {
    if (ie5 || opera) {
        marginbottom = document.body.clientHeight
        marginright = document.body.clientWidth
    }
    else if (ns6) {
        marginbottom = window.innerHeight
        marginright = window.innerWidth
    }
    var snowsizerange=snowmaxsize-snowminsize
    for (i=0;i<=snowmax;i++) {
        crds[i] = 0;
        lftrght[i] = Math.random()*15;
        x_mv[i] = 0.03 + Math.random()/10;
        snow[i]=document.getElementById("s"+i)
        snow[i].style.fontFamily=snowtype[randommaker(snowtype.length)]
        snow[i].size=randommaker(snowsizerange)+snowminsize
        snow[i].style.fontSize=snow[i].size
        snow[i].style.color=snowcolor[randommaker(snowcolor.length)]
        snow[i].sink=sinkspeed*snow[i].size/5
        if (snowingzone==1) {snow[i].posx=randommaker(marginright-snow[i].size)}
        if (snowingzone==2) {snow[i].posx=randommaker(marginright/2-snow[i].size)}
        if (snowingzone==3) {snow[i].posx=randommaker(marginright/2-snow[i].size)+marginright/4}
        if (snowingzone==4) {snow[i].posx=randommaker(marginright/2-snow[i].size)+marginright/2}
        snow[i].    posy=randommaker(2*marginbottom-marginbottom-2*snow[i].size)
        snow[i].style.left=snow[i].posx
        snow[i].style.top=snow[i].posy
    }
    movesnow()
}

function movesnow() {
    for (i=0;i<=snowmax;i++) {
        crds[i] += x_mv[i];
        snow[i].posy+=snow[i].sink
        snow[i].style.left=snow[i].posx+lftrght[i]*Math.sin(crds[i]);
        snow[i].style.top=snow[i].posy

        if (snow[i].posy>=marginbottom-2*snow[i].size || parseInt(snow[i].style.left)>(marginright-3*lftrght[i])){
            if (snowingzone==1) {snow[i].posx=randommaker(marginright-snow[i].size)}
            if (snowingzone==2) {snow[i].posx=randommaker(marginright/2-snow[i].size)}
            if (snowingzone==3) {snow[i].posx=randommaker(marginright/2-snow[i].size)+marginright/4}
            if (snowingzone==4) {snow[i].posx=randommaker(marginright/2-snow[i].size)+marginright/2}
            snow[i].posy=0
        }
    }
    var timer=setTimeout("movesnow()",50)
}

for (i=0;i<=snowmax;i++) {
    document.write("<span id='s"+i+"' style='position:absolute;top:-"+snowmaxsize+"'>"+snowletter+"</span>")
}
if (browserok) {
    window.onload=initsnow
}
function colorChange() {
  var color = ["#000000","#FC5C7D", "#6A82FB", "#38ef7d", "#fffbd5", "#b20a2c", "#CAC531","ffc0cb"];

  var num = Math.floor(Math.random() * color.length);
  var bodyTag = document.getElementById("colorCont");
  bodyTag.style.backgroundColor = color[num];
}
</script>
  <style>

  .l1{font-size:130px;

      color:white;}


  .l2{font-size:135px;


  color:pink;

  position:absolute ;
  top:10px;


  }
  .l3{font-size:135px;
  top:10px;
  right: 3px;
    position:absolute ;
      color:black;}

  .h{font-size:100px;

}

  <!DOCTYPE html>

  </style>
    <body id="colorCont" align="center" >

<div align=center>
        <div class="l1">Hire me

        <br>
            it is
        <br>
            would
            <br>
            you
        </div>

        <div class="l2">Hire me

        <br>
            it is
        <br>
            would
            <br>
            you
        </div>
        <div class="l3">Hire me

        <br>
            it is
        <br>
            would
            <br>
            you
        </div>
<br><br>

        <div class="h">
        <button onclick="colorChange()">
      <img src="https://mblogthumb-phinf.pstatic.net/20120326_126/jo1heon_1332723845990fCAJ1_JPEG/1.jpg?type=w2" largesrc="javascript:location.href='https://mblogthumb-phinf.pstatic.net/20120326_126/jo1heon_1332723845990fCAJ1_JPEG/1.jpg?type=w2'" id="img_1" data-top="440" style="visibility: visible;">

        </button>
        </div>
</div>
<br>
<footer>
<h4>by.Juyong</h4>
</footer>
    </body>

</html>
