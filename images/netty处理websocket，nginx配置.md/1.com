
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>websocket在线测试</title>
    <meta content="WebSocket 在线测试 工具 物联网" name="description">
    <meta content="WebSocket 在线测试 工具 物联网" name="keywords">
    <link rel="stylesheet" href="CSS/min/index.css" />
    <link rel="stylesheet" href="CSS/min/bootstrap.min.css" />
    <meta charset="utf-8" />
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?026b3828b6b2d9f98dc9e928d90d2c37";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>

</head>
<body>
    <div class="page-header">
        <h1 style="margin-top:-20px;margin-left:20px;font-size:30px;">WebSocket 在线测试 v13 <small>by 煌</small></h1>
        <div style="position:absolute;top:5px;left:450px;"><a href="https://www.lan-lin.com" target="_blank"><img style="margin-left:5px;" hight="46" width="46" src="IMG/lanlin.png" /><img src="IMG/new.gif" height="24" style="margin-top:-25px;" /><div style="font-weight:900;margin-left:5px;color:#009688;">蓝林网</div></a></div>
        <div style="position:absolute;top:5px;left:545px;"><a href="/client.html" target="_blank" title="websocket与socket程序工具"><img style="margin-left:5px;" hight="46" width="46" src="IMG/Server.png" /><div style="font-weight:900;">转发场景</div></a></div>
        <div style="position:absolute;top:5px;left:605px;"><a href="http://www.blue-zero.com/wb/Socket_WebSocket客户端程序v120.zip" target="_blank"><img style="margin-left:42px;" hight="46" width="46" src="IMG/Client.png" /><div style="font-weight:900;margin-left:30px;">WS客户端</div></a></div>
        <div style="position:absolute;top:5px;left:730px;"><a href="http://www.blue-zero.com/chat/" target="_blank"><img style="margin-left:28px;" hight="46" width="46" src="IMG/chat.png" /><img src="IMG/new.gif" height="24" style="margin-top:-25px;" /><div style="font-weight:900;">点击进入聊天室</div></a></div>
        <div style="position:absolute;top:5px;left:850px;"><a href="http://www.blue-zero.com/wb/WebSocket压力并发测试v107.zip" target="_blank"><img style="margin-left:34px;" hight="46" width="46" src="IMG/tool1.png" /><img src="IMG/new.gif" height="24" style="margin-top:-25px;" /><div style="font-weight:900;">并发压力测试工具</div></a></div>
        <div style="position:absolute;top:5px;left:980px;"><a href="http://www.blue-zero.com/wb/WebSocket服务端程序v160.zip?v=1" target="_blank"><img style="margin-left:20px;" hight="46" width="46" src="IMG/Wsserver.png" /><div style="font-weight:900;">该平台服务端</div></a></div>
        <div style="position:absolute;top:5px;left:1080px;"><a href="http://121.40.165.18:8088/" target="_blank"><img style="margin-left:25px;" hight="46" width="46" src="IMG/lot.png" /><div style="font-weight:900;">物联网测控平台</div></a></div>
<div style='margin-left:25px;margin-top:30px;color:gray;font-size:14px;'>Websocket是一种用于H5浏览器的实时通讯协议，可以做到数据的实时推送，可适用于广泛的工作环境，例如客服系统、物联网数据传输系统，该测试工具可用于websocket开发初期的测试工作</div>
    </div>
    <div>
        <div class="zone_conn">
            <input type="text" class="form-control" style="float:left;" id="inp_url" value="ws://121.40.165.18:8800" placeholder="连接的地址" />
            <button type="button" id="btn_conn" class="btn btn-primary" style="float:left;margin-left:10px;margin-right:10px;" onclick="fun_initWebSocket();">连接</button>
            <button type="button" id="btn_close" class="btn btn-danger" style="float:left;" disabled="disabled" onclick="fun_close();">断开</button>
        </div>
        <div class="clearboth" style='width:430px;'>
            1、连接格式为 ws://IP或域名:端口（示例ws://121.40.165.18:8800）<br />
            2、对于<span style="color:red">内网</span>的测试环境，只需填入服务端的<span style="color:red">内网IP</span>和端口<br />
            3、可连接我上面提供的服务端ws地址来测试您<span style="color:red">自己的客户端</span>
        </div>
        <div class="zone_send">
            <a id="emoji" style="position:relative;left:374px;bottom:5px;cursor:pointer;" data-toggle="popover" title="表情"><img style="outline-width:40px;" src="http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/5c/huanglianwx_thumb.gif" />表情</a>
            <textarea id="inp_send" class="form-control" style="height:100px;" placeholder="发送的内容"></textarea>
            <br />
            <button type="button" id="btn_send" class="btn btn-info" onclick="fun_sendto();">发送（ctrl+回车）</button>
            <div style='margin-top:10px;color:red;line-height:30px;'>1、平台兼容IE6及以上的任何浏览器接入</div>
            <div style='color:red;line-height:30px;'>2、服务端未使用任何框架，原生方式实现，更清楚WebSocket底层流程</div>
            <div style='color:red;line-height:30px;'>3、服务端支持多客户端数据收发</div>
            <div style='color:red;line-height:30px;'>4、需要完整的【客户端/服务端(C#.NET)】源码请咨询作者</div>
            <div data-toggle="modal" data-target="#myModal" style='color:blue;line-height:30px;font-size:16px;cursor:pointer;text-decoration:underline;'><img src="img/wexin.png" height="30" style="margin-right:10px;" />联系作者</div>
        </div>
    </div>
    <div style="position:absolute;top:120px;left:470px;">
        <div id="div_msgzone" class="panel panel-default">
            <div class="panel-heading">消息窗口</div>
            <div id="div_msg" class="panel-body"></div>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">感谢捐赠</h4>
                </div>
                <div class="modal-body" style="text-align:center;">
                    感谢您对作者的捐赠，您的付出都是对作者更好的呈现一些websocket体验的支持。
                    <br />
                 <div style='color:green;font-weight:900;margin-top:5px;margin-bottom:5px;margin-left:10px;'><img src="img/wexin.png" height="30" />微信：yaohuang46（请备注开发语言）</div>
                 <div style='color:green;font-weight:900;margin-bottom:5px;'><img src="img/qq.png" height="30" />QQ ：114687576（请备注开发语言）</div>
                    <img src="img/weixin.png" height="200" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div><div style="margin-top:100px;margin-left:20px;"><a href="http://beian.miit.gov.cn">闽ICP备14008306号-4</a></div>
    <script type="text/javascript" src="JS/min/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="JS/min/bootstrap.min.js"></script>
    <script type="text/javascript" src="JS/min/index.js?v=123"></script>
</body>
</html>
