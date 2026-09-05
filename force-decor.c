	#define _GNU_SOURCE
	#include <dlfcn.h>
	typedef struct _GtkWindow GtkWindow;
	typedef struct _GtkWidget GtkWidget;
	/* 应用请求"去掉装饰"时，强制改回"有装饰" */
	void gtk_window_set_decorated(GtkWindow *win, int setting)
	{
	    static void (*real)(GtkWindow *, int) = 0;
	    if (!real)
	        real = (void (*)(GtkWindow *, int))dlsym(RTLD_NEXT,
	                                                 "gtk_window_set_decorated");
	    if (real) real(win, 1);
	}
	/* 拦截"安装自绘标题栏"，保留系统默认标题栏 */
	void gtk_window_set_titlebar(GtkWindow *win, GtkWidget *bar)
	{
	    (void)win; (void)bar;
	}
