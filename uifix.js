
var DEBUG_HOST = "127.0.0.1";
var DEBUG_PORT = 9999

$(function()
{
  $.getJSON(
    "http://" + DEBUG_HOST + ":" + DEBUG_PORT + "/json",
    function(data)
    {
      $.each(data, function(index, view)
      {
        var url = view["webSocketDebuggerUrl"];
        var socket = new WebSocket(url);
        socket.onopen = function() { socket.close(); }
      });
    });
});
