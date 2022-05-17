--- ./src/core/aws-net-websocket-registry.adb	2021-10-07 03:24:29.000000000 +1100
+++ ./src/core/aws-net-websocket-registry.adb-new	2022-05-17 16:39:54.204553977 +1000
@@ -46,7 +46,6 @@
 with AWS.Net.Memory;
 with AWS.Net.Poll_Events;
 with AWS.Net.Std;
-with AWS.Net.WebSocket;
 with AWS.Utils;
 
 package body AWS.Net.WebSocket.Registry is
