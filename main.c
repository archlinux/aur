#include <gtk/gtk.h>
#include <webkit/webkit.h>

void keypress(GtkWidget* webview, guint key, guint keycode, GdkModifierType state, GtkEventControllerKey* eventController) 
{
	if (key == GDK_KEY_F5 || ((key == GDK_KEY_r || key == GDK_KEY_R) && (state & GDK_CONTROL_MASK) != 0)) 
	{
		if ((state & GDK_SHIFT_MASK) != 0)
			webkit_web_view_reload_bypass_cache(WEBKIT_WEB_VIEW(webview));
		else
			webkit_web_view_reload(WEBKIT_WEB_VIEW(webview));
	}
}

void activate(GtkApplication* app, gpointer data) 
{
	GtkWindow* window = GTK_WINDOW(gtk_application_window_new(app));
	WebKitWebView* webview = WEBKIT_WEB_VIEW(webkit_web_view_new());

	webkit_web_view_load_uri(webview, "https://app.whiteboard.microsoft.com/");

	GtkEventController* eventController = gtk_event_controller_key_new();
	g_signal_connect_object(eventController, "key-pressed", G_CALLBACK(keypress), webview, G_CONNECT_SWAPPED);

	gtk_window_set_child(window, GTK_WIDGET(webview));
	gtk_window_set_title(window, "Micorosft Whiteboard");
	gtk_window_set_default_size(window, 1280, 720);
	gtk_window_set_resizable(window, true);
	gtk_widget_add_controller(GTK_WIDGET(window), eventController);

	gtk_window_present(window);
}

int main() 
{
	GtkApplication* app = gtk_application_new(NULL, G_APPLICATION_DEFAULT_FLAGS);

	g_signal_connect(app, "activate", G_CALLBACK(activate), NULL);

	int status = g_application_run(G_APPLICATION(app), 0, NULL);
	g_object_unref(app);

	return status;
}
