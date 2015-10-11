diff --git a/src/wl/sys/wl_linux.c.orig b/src/wl/sys/wl_linux.c
index eb00717..489c9f5 100644
--- a/src/wl/sys/wl_linux.c.orig
+++ b/src/wl/sys/wl_linux.c
@@ -2166,8 +2166,8 @@ wl_start(struct sk_buff *skb, struct net_device *dev)
 	wlif = WL_DEV_IF(dev);
 	wl = WL_INFO(dev);
 
+	skb->prev = NULL;
 	if (WL_ALL_PASSIVE_ENAB(wl) || (WL_RTR() && WL_CONFIG_SMP())) {
-		skb->prev = NULL;
 
 		TXQ_LOCK(wl);
 
