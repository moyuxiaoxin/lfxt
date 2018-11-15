<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>

<META content="农历; 公历; 日历; 节日; 时区; 节气; 八字; 干支; 生肖; gregorian solar; chinese lunar; calendar;" name=keywords>
<META content=All name=robots>
<META content="gregorian solar calendar and chinese lunar calendar" name=description>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>美容美发管理系统</title>
<link href="../css/ht_css.css" rel="stylesheet" type="text/css" />
<SCRIPT language=JavaScript>
<!--
/*****************************************************************************
日期资料
*****************************************************************************/

var lunarInfo=new Array(
0x04bd8,0x04ae0,0x0a570,0x054d5,0x0d260,0x0d950,0x16554,0x056a0,0x09ad0,0x055d2,
0x04ae0,0x0a5b6,0x0a4d0,0x0d250,0x1d255,0x0b540,0x0d6a0,0x0ada2,0x095b0,0x14977,
0x04970,0x0a4b0,0x0b4b5,0x06a50,0x06d40,0x1ab54,0x02b60,0x09570,0x052f2,0x04970,
0x06566,0x0d4a0,0x0ea50,0x06e95,0x05ad0,0x02b60,0x186e3,0x092e0,0x1c8d7,0x0c950,
0x0d4a0,0x1d8a6,0x0b550,0x056a0,0x1a5b4,0x025d0,0x092d0,0x0d2b2,0x0a950,0x0b557,
0x06ca0,0x0b550,0x15355,0x04da0,0x0a5d0,0x14573,0x052d0,0x0a9a8,0x0e950,0x06aa0,
0x0aea6,0x0ab50,0x04b60,0x0aae4,0x0a570,0x05260,0x0f263,0x0d950,0x05b57,0x056a0,
0x096d0,0x04dd5,0x04ad0,0x0a4d0,0x0d4d4,0x0d250,0x0d558,0x0b540,0x0b5a0,0x195a6,
0x095b0,0x049b0,0x0a974,0x0a4b0,0x0b27a,0x06a50,0x06d40,0x0af46,0x0ab60,0x09570,
0x04af5,0x04970,0x064b0,0x074a3,0x0ea50,0x06b58,0x055c0,0x0ab60,0x096d5,0x092e0,
0x0c960,0x0d954,0x0d4a0,0x0da50,0x07552,0x056a0,0x0abb7,0x025d0,0x092d0,0x0cab5,
0x0a950,0x0b4a0,0x0baa4,0x0ad50,0x055d9,0x04ba0,0x0a5b0,0x15176,0x052b0,0x0a930,
0x07954,0x06aa0,0x0ad50,0x05b52,0x04b60,0x0a6e6,0x0a4e0,0x0d260,0x0ea65,0x0d530,
0x05aa0,0x076a3,0x096d0,0x04bd7,0x04ad0,0x0a4d0,0x1d0b6,0x0d250,0x0d520,0x0dd45,
0x0b5a0,0x056d0,0x055b2,0x049b0,0x0a577,0x0a4b0,0x0aa50,0x1b255,0x06d20,0x0ada0,
0x14b63);

var solarMonth=new Array(31,28,31,30,31,30,31,31,30,31,30,31);
var Gan=new Array("甲","乙","丙","丁","戊","己","庚","辛","壬","癸");
var Zhi=new Array("子","丑","寅","卯","辰","巳","午","未","申","酉","戌","亥");
var Animals=new Array("鼠","牛","虎","兔","龙","蛇","马","羊","猴","鸡","狗","猪");
var solarTerm = new Array("小寒","大寒","立春","雨水","惊蛰","春分","清明","谷雨","立夏","小满","芒种","夏至","小暑","大暑","立秋","处暑","白露","秋分","寒露","霜降","立冬","小雪","大雪","冬至");
var sTermInfo = new Array(0,21208,42467,63836,85337,107014,128867,150921,173149,195551,218072,240693,263343,285989,308563,331033,353350,375494,397447,419210,440795,462224,483532,504758);
var nStr1 = new Array('日','一','二','三','四','五','六','七','八','九','十');
var nStr2 = new Array('初','十','廿','卅','　');
var monthName = new Array("JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC");

//公历节日 *表示放假日
var sFtv = new Array(
"0101*新年元旦",
"0202 世界湿地日",
"0210 国际气象节",
"0214 情人节",
"0303 全国爱耳日",
"0308 妇女节",
"0314 国际警察日",
"0315 国际消费者权益日",
"0321 世界森林日",
"0321 世界儿歌日",
"0322 世界水日",
"0323 世界气象日",
"0324 世界防治结核病日",
"0330 Tommy 生日^^",
"0312 植树节",
"0401 愚人节",
"0407 世界卫生日",
"0422 世界地球日",
"0501 国际劳动节",
"0504 中国青年节",
"0505 碘缺乏病防治日",
"0508 世界红十字日",
"0512 国际护士节",
"0515 国际家庭日",
"0517 世界电信日",
"0518 国际博物馆日",
"0520 全国学生营养日",
"0523 国际牛奶日",
"0531 世界无烟日",
"0601 国际儿童节",
"0605 世界环境日",
"0606 全国爱眼日",
"0617 防治荒漠化和干旱日",
"0623 国际奥林匹克日",
"0625 全国土地日",
"0626 国际反毒品日",
"0701 建党日",
"0707 中国人民抗日战争纪念日",
"0711 世界人口日",
"0801 建军节",
"0908 国际扫盲日",
"0910 教师节",
"0914 梅竹松 生日^o^",
"0916 国际臭氧层保护日",
"0920 国际爱牙日",
"0927 世界旅游日",
"1001*国庆节",
"1001 国际音乐日",
"1004 世界动物日",
"1008 全国高血压日",
"1008 世界视觉日",
"1009 世界邮政日",
"1015 国际盲人节",
"1016 世界粮食日",
"1017 世界消除贫困日",
"1024 联合国日",
"1108 中国记者日",
"1109 消防宣传日",
"1114 世界糖尿病日",
"1117 国际大学生节",
"1201 世界艾滋病日",
"1203 世界残疾人日",
"1209 世界足球日",
"1229 国际生物多样性日");

//农历节日 *表示放假日
var lFtv = new Array(
"0101*春节",
"0115 元宵节",
"0323 妈祖生辰 (天上圣母诞辰)",
"0505 端午节",
"0707 七七情人节",
"0815*中秋节",
"0909 重阳节",
"1208 腊八节",
"0100*除夕");

//某月的第几个星期几
var wFtv = new Array(
"0520 国际母亲节",
"0530 全国助残日",
"0630 父亲节国际母亲节",
"0911 劳动节",
"0932 国际和平日",
"0940 国际聋人节",
"1011 国际住房日",
"1013 国际减轻自然灾害日",
"1144 感恩节");


/*****************************************************************************
日期计算
*****************************************************************************/

//====================================== 传回农历 y年的总天数
function lYearDays(y) {
var i, sum = 348;
for(i=0x8000; i>0x8; i>>=1) sum += (lunarInfo[y-1900] & i)? 1: 0;
return(sum+leapDays(y));
}

//====================================== 传回农历 y年闰月的天数
function leapDays(y) {
if(leapMonth(y)) return((lunarInfo[y-1900] & 0x10000)? 30: 29);
else return(0);
}

//====================================== 传回农历 y年闰哪个月 1-12 , 没闰传回 0
function leapMonth(y) {
return(lunarInfo[y-1900] & 0xf);
}

//====================================== 传回农历 y年m月的总天数
function monthDays(y,m) {
return( (lunarInfo[y-1900] & (0x10000>>m))? 30: 29 );
}

//====================================== 算出农历, 传入日期物件, 传回农历日期物件
// 该物件属性有 .year .month .day .isLeap .yearCyl .dayCyl .monCyl
function Lunar(objDate) {

var i, leap=0, temp=0;
var offset = (Date.UTC(objDate.getFullYear(),objDate.getMonth(),objDate.getDate()) - Date.UTC(1900,0,31))/86400000;

this.dayCyl = offset + 40;
this.monCyl = 14;

for(i=1900; i<2050 && offset>0; i++) {
temp = lYearDays(i);
offset -= temp;
this.monCyl += 12;
}

if(offset<0) {
offset += temp;
i--;
this.monCyl -= 12;
}

this.year = i;
this.yearCyl = i-1864;

leap = leapMonth(i); //闰哪个月
this.isLeap = false;

for(i=1; i<13 && offset>0; i++) {
//闰月
if(leap>0 && i==(leap+1) && this.isLeap==false)
{ --i; this.isLeap = true; temp = leapDays(this.year); }
else
{ temp = monthDays(this.year, i); }

//解除闰月
if(this.isLeap==true && i==(leap+1)) this.isLeap = false;

offset -= temp;
if(this.isLeap == false) this.monCyl ++;
}

if(offset==0 && leap>0 && i==leap+1)
if(this.isLeap)
{ this.isLeap = false; }
else
{ this.isLeap = true; --i; --this.monCyl;}

if(offset<0){ offset += temp; --i; --this.monCyl; }

this.month = i;
this.day = offset + 1;
}

//==============================传回公历 y年某m+1月的天数
function solarDays(y,m) {
if(m==1)
return(((y%4 == 0) && (y%100 != 0) || (y%400 == 0))? 29: 28);
else
return(solarMonth[m]);
}
//============================== 传入 offset 传回干支, 0=甲子
function cyclical(num) {
return(Gan[num%10]+Zhi[num%12]);
}

//============================== 日历属性
function calElement(sYear,sMonth,sDay,week,lYear,lMonth,lDay,isLeap,cYear,cMonth,cDay) {

this.isToday = false;
//公历
this.sYear = sYear;
this.sMonth = sMonth;
this.sDay = sDay;
this.week = week;
//农历
this.lYear = lYear;
this.lMonth = lMonth;
this.lDay = lDay;
this.isLeap = isLeap;
//干支
this.cYear = cYear;
this.cMonth = cMonth;
this.cDay = cDay;

this.color = '';

this.lunarFestival = ''; //农历节日
this.solarFestival = ''; //公历节日
this.solarTerms = ''; //节气

}

//===== 某年的第n个节气为几日(从0小寒起算)
function sTerm(y,n) {
var offDate = new Date( ( 31556925974.7*(y-1900) + sTermInfo[n]*60000 ) + Date.UTC(1900,0,6,2,5) );
return(offDate.getUTCDate());
}

//============================== 传回日历物件 (y年,m+1月)
function calendar(y,m) {

var sDObj, lDObj, lY, lM, lD=1, lL, lX=0, tmp1, tmp2;
var lDPOS = new Array(3);
var n = 0;
var firstLM = 0;

sDObj = new Date(y,m,1,0,0,0,0); //当月一日日期

this.length = solarDays(y,m); //公历当月天数
this.firstWeek = sDObj.getDay(); //公历当月1日星期几


for(var i=0;i<this.length;i++) {

if(lD>lX) {
sDObj = new Date(y,m,i+1); //当月一日日期
lDObj = new Lunar(sDObj); //农历
lY = lDObj.year; //农历年
lM = lDObj.month; //农历月
lD = lDObj.day; //农历日
lL = lDObj.isLeap; //农历是否闰月
lX = lL? leapDays(lY): monthDays(lY,lM); //农历当月最後一天

if(n==0) firstLM = lM;
lDPOS[n++] = i-lD+1;
}

//sYear,sMonth,sDay,week,
//lYear,lMonth,lDay,isLeap,
//cYear,cMonth,cDay
this[i] = new calElement(y, m+1, i+1, nStr1[(i+this.firstWeek)%7],
lY, lM, lD++, lL,
cyclical(lDObj.yearCyl) ,cyclical(lDObj.monCyl), cyclical(lDObj.dayCyl++) );

if((i+this.firstWeek)%7==0) this[i].color = 'red'; //周日颜色
if((i+this.firstWeek)%14==13) this[i].color = 'red'; //周休二日颜色
}

//节气
tmp1=sTerm(y,m*2 )-1;
tmp2=sTerm(y,m*2+1)-1;
this[tmp1].solarTerms = solarTerm[m*2];
this[tmp2].solarTerms = solarTerm[m*2+1];
if(m==3) this[tmp1].color = 'red'; //清明颜色

//公历节日
for(i in sFtv)
if(sFtv[i].match(/^(\d{2})(\d{2})([\s\*])(.+)$/))
if(Number(RegExp.$1)==(m+1)) {
this[Number(RegExp.$2)-1].solarFestival += RegExp.$4 + ' ';
if(RegExp.$3=='*') this[Number(RegExp.$2)-1].color = 'red';
}

//月周节日
for(i in wFtv)
if(wFtv[i].match(/^(\d{2})(\d)(\d)([\s\*])(.+)$/))
if(Number(RegExp.$1)==(m+1)) {
tmp1=Number(RegExp.$2);
tmp2=Number(RegExp.$3);
this[((this.firstWeek>tmp2)?7:0) + 7*(tmp1-1) + tmp2 - this.firstWeek].solarFestival += RegExp.$5 + ' ';
}

//农历节日
for(i in lFtv)
if(lFtv[i].match(/^(\d{2})(.{2})([\s\*])(.+)$/)) {
tmp1=Number(RegExp.$1)-firstLM;
if(tmp1==-11) tmp1=1;
if(tmp1 >=0 && tmp1<n) {
tmp2 = lDPOS[tmp1] + Number(RegExp.$2) -1;
if( tmp2 >= 0 && tmp2<this.length) {
this[tmp2].lunarFestival += RegExp.$4 + ' ';
if(RegExp.$3=='*') this[tmp2].color = 'red';
}
}
}

if(m==2) this[20].solarFestival = this[20].solarFestival+unescape('%20%u6D35%u8CE2%u751F%u65E5');

//黑色星期五
if((this.firstWeek+12)%7==5)
this[12].solarFestival += '黑色星期五';

//今日
if(y==tY && m==tM) this[tD-1].isToday = true;

}

//====================== 中文日期
function cDay(d){
var s;

switch (d) {
case 10:
s = '初十'; break;
case 20:
s = '二十'; break;
break;
case 30:
s = '三十'; break;
break;
default :
s = nStr2[Math.floor(d/10)];
s += nStr1[d%10];
}
return(s);
}


///////////////////////////////////////////////////////////////////////////////

var cld;

function drawCld(SY,SM) {
var i,sD,s,size;
cld = new calendar(SY,SM);

if(SY>1949 && SY<2051) yDisplay = '建国' + (((SY-1949)==1)?'元':SY-1949);
if(SY<1949 && SY>1900) yDisplay = '公元' + (SY);

GZ.innerHTML = yDisplay +'年 农历' + cyclical(SY-1900+36) + '年 【'+Animals[(SY-4)%12]+'年】';

YMBG.innerHTML = " " + SY + "<BR> " + monthName[SM];


for(i=0;i<42;i++) {

sObj=eval('SD'+ i);
lObj=eval('LD'+ i);

sObj.className = '';

sD = i - cld.firstWeek;

if(sD>-1 && sD<cld.length) { //日期内
sObj.innerHTML = sD+1;

if(cld[sD].isToday) sObj.className = 'todyaColor'; //今日颜色

sObj.style.color = cld[sD].color; //法定假日颜色

if(cld[sD].lDay==1) //显示农历月
lObj.innerHTML = '<b>'+(cld[sD].isLeap?'闰':'') + cld[sD].lMonth + '月' + (monthDays(cld[sD].lYear,cld[sD].lMonth)==29?'小':'大')+'</b>';
else //显示农历日
lObj.innerHTML = cDay(cld[sD].lDay);

s=cld[sD].lunarFestival;
if(s.length>0) { //农历节日
if(s.length>6) s = s.substr(0, 4)+'…';
s = s.fontcolor('red');
}
else { //公历节日
s=cld[sD].solarFestival;
if(s.length>0) {
size = (s.charCodeAt(0)>0 && s.charCodeAt(0)<128)?8:4;
if(s.length>size+2) s = s.substr(0, size)+'…';
s = s.fontcolor('blue');
}
else { //廿四节气
s=cld[sD].solarTerms;
if(s.length>0) s = s.fontcolor('limegreen');
}
}
if(s.length>0) lObj.innerHTML = s;

}
else { //非日期
sObj.innerHTML = '';
lObj.innerHTML = '';
}
}
}


function changeCld() {
var y,m;
y=CLD.SY.selectedIndex+1900;
m=CLD.SM.selectedIndex;
drawCld(y,m);
}

function pushBtm(K) {
switch (K){
case 'YU' :
if(CLD.SY.selectedIndex>0) CLD.SY.selectedIndex--;
break;
case 'YD' :
if(CLD.SY.selectedIndex<150) CLD.SY.selectedIndex++;
break;
case 'MU' :
if(CLD.SM.selectedIndex>0) {
CLD.SM.selectedIndex--;
}
else {
CLD.SM.selectedIndex=11;
if(CLD.SY.selectedIndex>0) CLD.SY.selectedIndex--;
}
break;
case 'MD' :
if(CLD.SM.selectedIndex<11) {
CLD.SM.selectedIndex++;
}
else {
CLD.SM.selectedIndex=0;
if(CLD.SY.selectedIndex<150) CLD.SY.selectedIndex++;
}
break;
default :
CLD.SY.selectedIndex=tY-1900;
CLD.SM.selectedIndex=tM;
}
changeCld();
}

var Today = new Date();
var tY = Today.getFullYear();
var tM = Today.getMonth();
var tD = Today.getDate();
//////////////////////////////////////////////////////////////////////////////

var width = "130";
var offsetx = 2;
var offsety = 8;

var x = 0;
var y = 0;
var snow = 0;
var sw = 0;
var cnt = 0;

var dStyle;
document.onmousemove = mEvn;

//显示详细日期资料
function mOvr(v) {
var s,festival;
var sObj=eval('SD'+ v);
var d=sObj.innerHTML-1;

//sYear,sMonth,sDay,week,
//lYear,lMonth,lDay,isLeap,
//cYear,cMonth,cDay

if(sObj.innerHTML!='') {

sObj.style.cursor = 's-resize';

if(cld[d].solarTerms == '' && cld[d].solarFestival == '' && cld[d].lunarFestival == '')
festival = '';
else
festival = '<TABLE WIDTH=100% BORDER=0 CELLPADDING=2 CELLSPACING=0 BGCOLOR="#CCFFCC"><TR><TD>'+
'<FONT COLOR="#000000" STYLE="font-size:9pt;">'+cld[d].solarTerms + ' ' + cld[d].solarFestival + ' ' + cld[d].lunarFestival+'</FONT></TD>'+
'</TR></TABLE>';

s= '<TABLE WIDTH="130" BORDER=0 CELLPADDING="2" CELLSPACING=0 BGCOLOR="#000066" style="filter:Alpha(opacity=80)"><TR><TD>' +
'<TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0><TR><TD ALIGN="right"><FONT COLOR="#ffffff" STYLE="font-size:9pt;">'+
cld[d].sYear+' 年 '+cld[d].sMonth+' 月 '+cld[d].sDay+' 日<br>星期'+cld[d].week+'<br>'+
'<font color="violet">农历'+(cld[d].isLeap?'闰 ':' ')+cld[d].lMonth+' 月 '+cld[d].lDay+' 日</font><br>'+
'<font color="yellow">'+cld[d].cYear+'年 '+cld[d].cMonth+'月 '+cld[d].cDay + '日</font>'+
'</FONT></TD></TR></TABLE>'+ festival +'</TD></TR></TABLE>';


document.all["detail"].innerHTML = s;

if (snow == 0) {
dStyle.left = x+offsetx-(width/2);
dStyle.top = y+offsety;
dStyle.visibility = "visible";
snow = 1;
}
}
}

//清除详细日期资料
function mOut() {
if ( cnt >= 1 ) { sw = 0; }
if ( sw == 0 ) { snow = 0; dStyle.visibility = "hidden";}
else cnt++;
}

//取得位置
function mEvn() {
x=event.x;
y=event.y;
if (document.body.scrollLeft)
{x=event.x+document.body.scrollLeft; y=event.y+document.body.scrollTop;}
if (snow){
dStyle.left = x+offsetx-(width/2);
dStyle.top = y+offsety;
}
}

///////////////////////////////////////////////////////////////////////////

function initialize() {
dStyle = detail.style;
CLD.SY.selectedIndex=tY-1900;
CLD.SM.selectedIndex=tM;
drawCld(tY,tM);
CLD.TZ.selectedIndex=getCookie("TZ");
changeTZ();
tick();
}

function terminate(){
setCookie("TZ",CLD.TZ.selectedIndex);
}

function setCookie(name, value) {
var today = new Date();
var expires = new Date();
expires.setTime(today.getTime() + 1000*60*60*24*365);
document.cookie = name + "=" + escape(value) + "; expires=" + expires.toGMTString();
}

function getCookie(Name) {
var search = Name + "=";
if(document.cookie.length > 0) {
offset = document.cookie.indexOf(search);
if(offset != -1) {
offset += search.length;
end = document.cookie.indexOf(";", offset);
if(end == -1) end = document.cookie.length;
return unescape(document.cookie.substring(offset, end));
}
else return "";
}
}



/////////////////////////////////////////////////////////

function changeTZ() {
CITY.innerHTML = CLD.TZ.value.substr(6);
var pos = Math.floor(CLD.TZ.value.substr(0,3));
if(pos<0) pos+=24;
pos*=-10;
world.style.left = pos;
}

function tick() {
var today;
today = new Date();
Clock.innerHTML = today.toLocaleString();
Clock2.innerHTML = TimeAdd(today.toGMTString(), CLD.TZ.value);
window.setTimeout("tick()", 1000);
}

//-->
</SCRIPT>

<SCRIPT language=VBScript>
<!--
'===== 算世界时间
Function TimeAdd(UTC,T)
Dim PlusMinus, DST, y
If Left(T,1)="-" Then PlusMinus = -1 Else PlusMinus = 1
UTC=Right(UTC,Len(UTC)-5)
UTC=Left(UTC,Len(UTC)-4)
y = Year(UTC)
TimeAdd=DateAdd("n", (Cint(Mid(T,2,2))*60 + Cint(Mid(T,4,2))) * PlusMinus, UTC)
'美国日光节约期间: 4月第一个星日00:00 至 10月最後一个星期日00:00
If Mid(T,6,1)="*" And DateSerial(y,4,(9 - Weekday(DateSerial(y,4,1)) mod 7) ) <= TimeAdd And DateSerial(y,10,31 - Weekday(DateSerial(y,10,31))) >= TimeAdd Then
TimeAdd=DateAdd("h", 1, TimeAdd)
tSave.innerHTML = "R"
tSave.style.color= "Red"
Else
tSave.innerHTML = "R"
tSave.style.color= "White"
End If
TimeAdd = FormatDateTime(Date, 1) & " " & FormatDateTime(TimeAdd,3)
End Function
'-->
</SCRIPT>

<STYLE>.todyaColor {
BACKGROUND-COLOR: aqua
}
</STYLE>

<META content="MSHTML 6.00.2600.0" name=GENERATOR>
</HEAD>
<BODY onload=initialize() onunload=terminate()>
<div class="right_nav" style="height:100%">   
<div id="tab">
	<ul>
		<li id="li1" class="right_bt"><span onclick="showdiv(1)">万年历</span></li>
	</ul>
	<div id="all">
	     <!--基础信息strat-->
		<div id="div1" class="dise">
              <div class="djcp_nrxx">
                <div class="right_tall">
<SCRIPT language=JavaScript><!--
if(navigator.appName == "Netscape" || parseInt(navigator.appVersion) < 4)
document.write("<h1>你的浏览器无法执行此程序。</h1>此程序　在 IE4 以後的版本才能执行!!")
//--></SCRIPT>

<DIV id=detail
style="FILTER: shadow(color=#333333,direction=135); WIDTH: 140px; POSITION: absolute; HEIGHT: 120px"></DIV>
<CENTER>
<FORM name=CLD>
<TABLE border=0>
<TBODY>
<TR>
<TD vAlign=top align=middle width=240><FONT style="FONT-SIZE: 9pt"
size=2>本地时间</FONT><BR><FONT id=Clock face=Arial color=#000080 size=2
align="center"></FONT>
<P><FONT id=CITY style="FONT-SIZE: 9pt; WIDTH: 150px; FONT-FAMILY: '宋体'; HEIGHT: 28px"></FONT><BR>
<FONT id=Clock2 face=Arial color=#000080 size=2 align="center"></FONT><BR>
<TABLE style="FONT-SIZE: 10pt; FONT-FAMILY: Wingdings">
<TBODY>
<TR>
<TD align=middle>
<DIV>
<FONT id=world style="FONT-SIZE: 185px; LEFT: 0px; COLOR: green; FONT-FAMILY: Webdings; POSITION: relative; TOP: -26px"></FONT>
</DIV>
</TD></TR></TBODY></TABLE>

<!--时区 *表示自动调整为日光节约时间-->
<FONT id=tSave style="FONT-SIZE: 18pt; COLOR: white; FONT-FAMILY: Wingdings"></FONT>
<FONT style="FONT-SIZE: 9pt" size=2>
<SELECT style="FONT-SIZE: 9pt" onchange=changeTZ() name=TZ> <OPTION
value="-1200 安尼威土克、瓜甲兰 " selected>国际日期变更线<OPTION
value="-1100 中途岛、萨摩亚群岛 ">萨摩亚<OPTION
value="-1000 夏威夷 ">夏威夷<OPTION
value="-0900*阿拉斯加 ">阿拉斯加<OPTION
value="-0800*太平洋时间(美加)、提亚纳 ">太平洋<OPTION
value="-0700*山区时间(美加) ">美加山区<OPTION
value="-0700 亚历桑那 ">美国山区<OPTION
value="-0600 中美洲 ">中美洲<OPTION
value="-0600*中部时间(美加) ">美加中部<OPTION
value="-0600*墨西哥市 ">墨西哥<OPTION
value="-0600 萨克其万(加拿大) ">加拿大中部<OPTION
value="-0500 波哥大、利马、祁多 ">南美洲太平洋<OPTION
value="-0500*东部时间(美加) ">美加东部<OPTION
value="-0500 印第安纳(东部) ">美东<OPTION
value="-0400*圣地牙哥 ">太平洋SA<OPTION
value="-0400 加拉卡斯、拉帕兹 ">南美洲西部<OPTION
value="-0400*大西洋时间(加拿大) ">大西洋<OPTION
value="-0330*新岛(加拿大东岸) ">纽芬兰<OPTION
value="-0300*格陵兰 ">格陵兰<OPTION
value="-0300*波西里亚 ">东南美洲<OPTION
value="-0300 布鲁诺斯爱丽斯、乔治城 ">南美洲东部<OPTION
value="-0200*大西洋中部 ">大西洋中部<OPTION
value="-0100 维德角群岛 ">维德角<OPTION
value="-0100*亚速尔群岛 ">亚速尔<OPTION
value="+0000 卡萨布兰卡、莫洛维亚(赖比瑞亚) ">格林威治<OPTION
value="+0000*格林威治:都柏林、爱丁堡、里斯本、伦敦 ">GMT<OPTION
value="+0100 中西非 ">中西非<OPTION
value="+0100*比欧瑞德、布拉提斯拉瓦、布达佩斯、布拉格 ">中欧<OPTION
value="+0100*布鲁赛尔、哥本哈根、马德里、巴黎 ">罗马<OPTION
value="+0100*沙拉耶佛、斯科比亚、苏非亚、华沙、札格瑞 ">中欧<OPTION
value="+0100*阿姆斯特丹、柏林、罗马、斯德哥尔摩、维也纳 ">西欧<OPTION
value="+0200*布加勒斯特 ">西欧<OPTION
value="+0200 耶路萨冷 ">耶路萨冷<OPTION
value="+0200*开罗 ">埃及<OPTION
value="+0200*雅典、伊斯坦堡、明斯克 ">GTB<OPTION
value="+0200 赫拉雷、皮托里 ">南非<OPTION
value="+0200*赫尔辛基、里加、泰里安 ">FLE芬兰<OPTION
value="+0300*巴格达 ">阿拉伯<OPTION
value="+0300 奈洛比 ">东非<OPTION
value="+0300 科威特、里雅德 ">阿拉伯<OPTION
value="+0300*莫斯科、圣彼得堡、窝瓦格瑞德 ">俄罗斯<OPTION
value="+0330*德黑兰 ">伊朗<OPTION
value="+0400*巴古、塔布理斯、费里凡 ">高加索<OPTION
value="+0400 阿布达比、莫斯凯 ">阿拉伯<OPTION
value="+0430 喀布尔 ">阿富汗<OPTION
value="+0500*伊卡特林堡 ">伊卡特林堡<OPTION
value="+0500 伊斯兰马巴德、克洛奇、塔须肯 ">西亚<OPTION
value="+0530 加尔各答、辰内、孟拜、新德里 ">印度<OPTION
value="+0545 加德满都 ">尼泊尔<OPTION
value="+0600*阿马提、诺曼斯比尔斯科 ">中北亚<OPTION
value="+0600 阿斯塔那、达卡 ">中亚<OPTION
value="+0600 斯里哈亚华登尼普拉 ">斯里兰卡<OPTION
value="+0630 仰光 ">缅甸<OPTION
value="+0700*克拉斯诺亚尔斯克 ">北亚<OPTION
value="+0700 曼谷、河内、雅加达 ">东南亚<OPTION
value="+0800 北京、重庆、香港、澳门、乌鲁木齐 ">中国大陆<OPTION
value="+0800 台北 ">中国台湾<OPTION
value="+0800*伊尔库次克、乌兰巴图 ">东北亚<OPTION
value="+0800 吉隆坡、新加坡 ">马来半岛<OPTION
value="+0800 伯斯 ">澳洲西部<OPTION
value="+0900 大阪、北海道、东京 ">东京<OPTION
value="+0900*亚库兹克 ">亚库兹克<OPTION
value="+0900 汉城 ">韩国<OPTION
value="+0930*爱德兰 ">澳洲中部<OPTION
value="+0930 达尔文 ">澳洲中部<OPTION
value="+1000 布里斯本 ">澳洲东部<OPTION
value="+1000*坎培拉、墨尔本、雪梨 ">澳洲东部<OPTION
value="+1000*海参威 ">海参威<OPTION
value="+1000*霍巴特 ">塔斯梅尼亚<OPTION
value="+1000 关岛、莫斯比港 ">西太平洋<OPTION
value="+1100 马哥大、所罗门群岛、新卡伦多尼亚 ">太平洋中部<OPTION
value="+1200 斐济、肯加塔、马歇尔群岛 ">斐济<OPTION
value="+1200*奥克兰、威灵顿 ">纽西兰<OPTION
value="+1300 努瓜娄发 ">东加</OPTION></SELECT>时间</FONT>

<P></P></TD>
</tr>
<tr>
<TD align=middle>
<DIV style="Z-INDEX: -1; POSITION: absolute; TOP: 30px"><FONT id=YMBG
style="FONT-SIZE: 100pt; COLOR: #f0f0f0; FONT-FAMILY: 'Arial Black'"> 0000<BR> JUN</FONT>
</DIV>
<TABLE border=0 width="602">
<TBODY>
<TR>
<TD bgColor=#000080 colSpan=7><FONT style="FONT-SIZE: 9pt"
color=#ffffff size=2>公历<SELECT style="FONT-SIZE: 9pt"
onchange=changeCld() name=SY>
<SCRIPT language=JavaScript><!--
for(i=1900;i<2051;i++) document.write('<option>'+i)
//--></SCRIPT>
</SELECT>年<SELECT style="FONT-SIZE: 9pt" onchange=changeCld()
name=SM>
<SCRIPT language=JavaScript><!--
for(i=1;i<13;i++) document.write('<option>'+i)
//--></SCRIPT>
</SELECT>月</FONT> <FONT id=GZ face=标楷体 color=#ffffff
size=4></FONT><BR></TD></TR>
<TR align=middle bgColor=#e0e0e0>
<TD width=86>日</TD>
<TD width=86>一</TD>
<TD width=86>二</TD>
<TD width=86>三</TD>
<TD width=86>四</TD>
<TD width=86>五</TD>
<TD width=86>六</TD></TR>
<SCRIPT language=JavaScript><!--
var gNum
for(i=0;i<6;i++) {
document.write('<tr align=center>')
for(j=0;j<7;j++) {
gNum = i*7+j
document.write('<td width=86 id="GD' + gNum +'" onMouseOver="mOvr(' + gNum +')" onMouseOut="mOut()"><font id="SD' + gNum +'" size=5 face="Arial Black"')
if(j == 0) document.write(' color=red')
if(j == 6)
if(i%2==1) document.write(' color=red')
else document.write(' color=green')
document.write(' TITLE=""> </font><br><font id="LD' + gNum + '" size=2 style="font-size:9pt"> </font></td>')
}
document.write('</tr>')
}
//--></SCRIPT>
</TBODY></TABLE></TD>
<TD vAlign=top align=middle width=40><BR><BR><BR><BR><BUTTON
onmouseover="this.style.color='orange'"
style="BORDER-RIGHT: 1px double; BORDER-TOP: 1px double; FONT-WEIGHT: normal; FONT-SIZE: 9pt; BORDER-LEFT: 1px double; COLOR: #000000; LINE-HEIGHT: normal; BORDER-BOTTOM: 1px double; FONT-STYLE: normal; BACKGROUND-COLOR: #f5f5f5; FONT-VARIANT: normal"
onclick="pushBtm('YU')"
onmouseout="this.style.color='#000000'">年↑</BUTTON><BR><BUTTON
onmouseover="this.style.color='orange'"
style="BORDER-RIGHT: 1px double; BORDER-TOP: 1px double; FONT-WEIGHT: normal; FONT-SIZE: 9pt; BORDER-LEFT: 1px double; COLOR: #000000; LINE-HEIGHT: normal; BORDER-BOTTOM: 1px double; FONT-STYLE: normal; BACKGROUND-COLOR: #f5f5f5; FONT-VARIANT: normal"
onclick="pushBtm('YD')"
onmouseout="this.style.color='#000000'">年↓</BUTTON>
<P><BUTTON onmouseover="this.style.color='orange'"
style="BORDER-RIGHT: 1px double; BORDER-TOP: 1px double; FONT-WEIGHT: normal; FONT-SIZE: 9pt; BORDER-LEFT: 1px double; COLOR: #000000; LINE-HEIGHT: normal; BORDER-BOTTOM: 1px double; FONT-STYLE: normal; BACKGROUND-COLOR: #f5f5f5; FONT-VARIANT: normal"
onclick="pushBtm('MU')"
onmouseout="this.style.color='#000000'">月↑</BUTTON><BR><BUTTON
onmouseover="this.style.color='orange'"
style="BORDER-RIGHT: 1px double; BORDER-TOP: 1px double; FONT-WEIGHT: normal; FONT-SIZE: 9pt; BORDER-LEFT: 1px double; COLOR: #000000; LINE-HEIGHT: normal; BORDER-BOTTOM: 1px double; FONT-STYLE: normal; BACKGROUND-COLOR: #f5f5f5; FONT-VARIANT: normal"
onclick="pushBtm('MD')"
onmouseout="this.style.color='#000000'">月↓</BUTTON>
<P><BUTTON onmouseover="this.style.color='orange'"
style="BORDER-RIGHT: 1px double; BORDER-TOP: 1px double; FONT-WEIGHT: normal; FONT-SIZE: 9pt; BORDER-LEFT: 1px double; COLOR: #000000; LINE-HEIGHT: normal; BORDER-BOTTOM: 1px double; FONT-STYLE: normal; BACKGROUND-COLOR: #f5f5f5; FONT-VARIANT: normal"
onclick="pushBtm('')" onmouseout="this.style.color='#000000'">当月</BUTTON>
<P></P></TD></TR></TBODY></TABLE></FORM><BR><BR></CENTER>
<input name="Submit2" type="button" class="button_bc" value="返 回" onclick="history.go(-1);" />
<SCRIPT language=JavaScript>
<!--

if (window.Event)
document.captureEvents(Event.MOUSEUP);

function nocontextmenu()
{
event.cancelBubble = true
event.returnValue = false;

return false;
}

function norightclick(e)
{
if (window.Event)
{
if (e.which == 2 || e.which == 3)
return false;
}
else
if (event.button == 2 || event.button == 3)
{
event.cancelBubble = true
event.returnValue = false;
return false;
}

}

document.oncontextmenu = nocontextmenu; // for IE5+
document.onmousedown = norightclick; // for all others
//-->
</SCRIPT>
				</div>
              </div>
        </div>
</BODY></HTML>
