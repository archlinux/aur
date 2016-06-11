*** aclocal.m4	2016-06-11 19:18:23.281881426 +1000
--- aclocal.m4-new	2016-06-11 19:18:39.538548759 +1000
***************
*** 426,431 ****
--- 426,433 ----
        ;;
     esac
  
+    GL_LIBS+=" -lm -lX11"
+ 
     AC_SUBST(GL_LIBS)
     AC_SUBST(GL_CFLAGS)
     AC_SUBST(HAVE_OPENGL)
