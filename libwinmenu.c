/*
 * gcc -shared  `pkg-config gtk+-x11-2.0 --cflags --libs` -o libwinmenu.so main.c
 * */

#include <gtk/gtk.h>
#include <gdk/gdkkeysyms.h>

#define _gtk_marshal_VOID__VOID g_cclosure_marshal_VOID__VOID
#define _gtk_marshal_NONE__NONE _gtk_marshal_VOID__VOID

static GObject* (*old_gtk_menu_bar_constructor)(GType type, guint n_construct_properties, GObjectConstructParam *construct_params) = NULL;
static GObject* (*old_gtk_window_constructor)(GType type, guint n_construct_properties, GObjectConstructParam *construct_params) = NULL;
static void     (*old_widget_show) (GtkWidget * widget) = NULL;

static void toggle_menu_bar (GtkWidget *widget, gpointer user_data)
{
   GtkWidget * wdg = GTK_WIDGET(user_data);
   GTK_WIDGET_GET_CLASS(wdg)->show = old_widget_show;
   if (GTK_WIDGET_VISIBLE(wdg))
      gtk_widget_hide(wdg);
   else
      gtk_widget_show(wdg);
}

static void anchor_event (GtkWidget *widget, GtkWidget *previous_toplevel, gpointer   user_data)
{
   GtkWidget *toplevel = gtk_widget_get_toplevel (widget);
   if (GTK_WIDGET_TOPLEVEL (toplevel)) {
      if (previous_toplevel) 
          g_signal_handlers_disconnect_by_func(previous_toplevel, G_CALLBACK(toggle_menu_bar), widget);
      g_signal_connect (toplevel, "toggle-menu-bar", G_CALLBACK(toggle_menu_bar), widget);
    }
}

static void show (GtkWidget *widget)
{
   if (GTK_IS_MENU_BAR(widget))
      return;
   old_widget_show(widget);
}

GObject* new_gtk_menu_bar_constructor (GType type, guint n_construct_properties, GObjectConstructParam *construct_params)
{
   GObject * ret = old_gtk_menu_bar_constructor(type,n_construct_properties,construct_params);
   g_signal_connect (ret, "hierarchy-changed", G_CALLBACK(anchor_event), NULL);
   g_signal_connect (ret, "can_activate_accel", G_CALLBACK(gtk_true), NULL);

   return ret;
}

G_MODULE_EXPORT void
gtk_module_init (gint * argc, gchar *** argv)
{
   GtkWidget *fc;
   GObjectClass *klass;
   const gchar *app_whitelist = "gnome-terminal, gimp, mousepad";

   if (strstr (app_whitelist, g_get_prgname()) != NULL)
	return;

   g_signal_new ("toggle-menu-bar",
                 GTK_TYPE_WINDOW,
                 G_SIGNAL_RUN_LAST | G_SIGNAL_ACTION,
                 0,
                 NULL, NULL,
                 _gtk_marshal_VOID__VOID,
                 G_TYPE_NONE,
                 0);

   fc = gtk_menu_bar_new();
   klass = GTK_MENU_BAR_GET_CLASS(fc);
   old_gtk_menu_bar_constructor = klass->constructor;
   klass->constructor = new_gtk_menu_bar_constructor;
   old_widget_show = GTK_WIDGET_CLASS(klass)->show;
   GTK_WIDGET_CLASS(klass)->show = show;

   fc = gtk_window_new(GTK_WINDOW_TOPLEVEL);
   klass = GTK_WINDOW_GET_CLASS(fc);

   gtk_binding_entry_add_signal (gtk_binding_set_by_class (klass), GDK_m, GDK_CONTROL_MASK,
                                "toggle-menu-bar", 0);
   gtk_binding_entry_add_signal (gtk_binding_set_by_class (klass), GDK_m, GDK_MOD1_MASK,
                                "toggle-menu-bar", 0);
}
