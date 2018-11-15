 var XMLHttpReq;//这个例子里面只用到一个XMLHttpRequest对象，用于获取服务端返回的XML序列
 	//创建XMLHttpRequest对象
    function createXMLHttpRequest() {
		if(window.XMLHttpRequest) { //Mozilla 浏览器
			XMLHttpReq = new XMLHttpRequest();
		}
		else if (window.ActiveXObject) { // IE浏览器
			try {
				XMLHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {}
			}
		}
	}
	//发送请求函数
	function sendRequest1(url) {
		createXMLHttpRequest();
		XMLHttpReq.open("GET", url, true);
		XMLHttpReq.onreadystatechange = processResponse1;//指定响应函数
		XMLHttpReq.send(null);  // 发送请求
	}
	// 处理返回信息函数
    function processResponse1() {
    	if (XMLHttpReq.readyState == 4) { // 判断对象状态
        	if (XMLHttpReq.status == 200) { // 信息已经成功返回，开始处理信息
				updateList1();
		    } else { //页面不正常
		      	alert("您所请求的页面有异常。");
		    }
        }
    }
	//更新菜单函数
	function updateList1() {
		var country=XMLHttpReq.responseXML.getElementsByTagName("country");
	    var list = document.all.sfms;
        document.all.jyjg.value=XMLHttpReq.responseXML.getElementsByTagName("slz")[0].firstChild.nodeValue;
	}

	// 创建级联菜单函数
	function showJyjg(obj) {
		sendRequest1("/basedata/cpjg.jsp?region=" + encodeURI(obj));
	}
	

function GetXmlHttpObject()
{
 var objXMLHttp=null;
 if(window.XMLHttpRequest)
 {
  objXMLHttp=new XMLHttpRequest();
 }
 else if(window.ActiveXObject)
 {
  objXMLHttp=new ActiveXObject("Microsoft.XMLHTTP");
 }
 return objXMLHttp;
}
