diff -u -r a/kernel/conftest.sh b/kernel/conftest.sh
--- a/kernel/conftest.sh	2018-11-01 11:00:14.429126159 +0000
+++ b/kernel/conftest.sh	2018-11-01 11:03:08.199579458 +0000
@@ -2372,8 +2372,13 @@
             #
             CODE="
             #include <drm/drmP.h>
+            #include <linux/version.h>
             void conftest_drm_mode_connector_list_update_has_merge_type_bits_arg(void) {
+            #if LINUX_VERSION_CODE < KERNEL_VERSION(4, 19, 0)
                 drm_mode_connector_list_update(
+            #else
+                drm_connector_list_update(
+            #endif
                     NULL,  /* struct drm_connector *connector */
                     true); /* bool merge_type_bits */
             }"
diff -u -r a/kernel/nvidia-drm/nvidia-drm-connector.c b/kernel/nvidia-drm/nvidia-drm-connector.c
--- a/kernel/nvidia-drm/nvidia-drm-connector.c	2018-08-22 00:55:29.000000000 +0000
+++ b/kernel/nvidia-drm/nvidia-drm-connector.c	2018-11-01 11:08:14.643715031 +0000
@@ -34,6 +34,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <linux/version.h>
 
 static void nv_drm_connector_destroy(struct drm_connector *connector)
 {
@@ -226,7 +227,11 @@
 
 
     if (nv_connector->edid != NULL) {
+#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 19, 0)
         drm_mode_connector_update_edid_property(
+#else
+        drm_connector_update_edid_property(
+#endif
             connector, nv_connector->edid);
     }
 
diff -u -r a/kernel/nvidia-drm/nvidia-drm-encoder.c b/kernel/nvidia-drm/nvidia-drm-encoder.c
--- a/kernel/nvidia-drm/nvidia-drm-encoder.c	2018-08-22 00:55:29.000000000 +0000
+++ b/kernel/nvidia-drm/nvidia-drm-encoder.c	2018-11-01 11:08:32.210427737 +0000
@@ -34,6 +34,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <linux/version.h>
 
 static void nv_drm_encoder_destroy(struct drm_encoder *encoder)
 {
@@ -216,7 +217,11 @@
 
     /* Attach encoder and connector */
 
+#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 19, 0)
     ret = drm_mode_connector_attach_encoder(connector, encoder);
+#else
+    ret = drm_connector_attach_encoder(connector, encoder);
+#endif
 
     if (ret != 0) {
         NV_DRM_DEV_LOG_ERR(
