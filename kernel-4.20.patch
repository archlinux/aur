--- a/kernel/nvidia/os-interface.c
+++ b/kernel/nvidia/os-interface.c
@@ -1670,7 +1670,7 @@
 
 struct nv_ipmi_softc
 {
-    ipmi_user_t         p_user;     // ptr to ipmi_msghandler user structure
+    struct ipmi_user    *p_user;
     spinlock_t          msg_lock;
     struct list_head    msgs;
     NvU32               seqNum;     //request sequence number
@@ -1679,7 +1679,7 @@
 static inline int
 nv_ipmi_set_my_address
 (
-    ipmi_user_t     user,
+    struct ipmi_user *user,
     unsigned char   address
 )
 {
--- a/kernel/nvidia-drm/nvidia-drm-gem-nvkms-memory.c
+++ b/kernel/nvidia-drm/nvidia-drm-gem-nvkms-memory.c
@@ -20,6 +20,8 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/version.h>
+
 #include "nvidia-drm-conftest.h"
 
 #if defined(NV_DRM_ATOMIC_MODESET_AVAILABLE)
@@ -345,7 +347,11 @@ static int __nv_drm_vma_fault(struct vm_area_struct *vma,
 
     page_offset = vmf->pgoff - drm_vma_node_start(&gem->vma_node);
 
+#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 19, 0)
     ret = vm_insert_pfn(vma, address, pfn + page_offset);
+#else
+    ret = vmf_insert_pfn(vma, address, pfn + page_offset);
+#endif
 
     switch (ret) {
         case 0:
