/*
 Copyright (C) 2011 Giuseppe Borzi <gborzi@ieee.org>

 This library is free software; you can redistribute it and/or
 modify it under the terms of the GNU Lesser General Public
 License as published by the Free Software Foundation; either
 version 2.1 of the License, or (at your option) any later version.

 Derived from formhistory.c extension, copyrighted by
 Alexander Butenko <a.butenka@gmail.com>
 Christian Dywan <christian@twotoasts.de>
*/

#include <midori/midori.h>

#include "config.h"
#include "midori/sokoke.h"

#include <gnome-keyring.h>
#include <glib/gstdio.h>
#include <stdlib.h>

#ifdef G_OS_WIN32
    #define LIBPREFIX ""
#else
    #define LIBPREFIX "lib"
#endif

static GHashTable* log_pass;
static gchar* jspassm;

static gboolean
passwman_prepare_js ()
{
   gchar* passwordmanager;

   if (!g_file_get_contents ("/usr/share/midori/res/passwordmanager.js", \
            &passwordmanager, NULL, NULL))
   {
       return FALSE;
   }
   g_strchomp (passwordmanager);

   jspassm = g_strdup_printf ( "%s", passwordmanager );
   g_strstrip (jspassm);
   g_free (passwordmanager);

   return TRUE;
/*   gchar* data_name;
   gchar* data_path;
   gchar* passwordmanager;
   gchar* file;

   data_name = g_build_filename (PACKAGE_NAME, "res", NULL);
   data_path = sokoke_find_data_filename (data_name,TRUE);
   g_free (data_name);
   file = g_build_filename(data_path,G_DIR_SEPARATOR_S,\
          "passwordmanager.js",NULL);
   if (!g_file_get_contents (file, &passwordmanager, NULL, NULL))
       return FALSE;
   g_strchomp (passwordmanager);

   jspassm = g_strdup_printf ( "%s", passwordmanager );
   g_strstrip (jspassm);
   g_free (data_path);
   g_free (file);
   g_free (passwordmanager);
   return TRUE;*/
}

static gchar*
cleanurl( const gchar *url )
{
    gchar *cleaned, *id;
    gssize il = -1;
    gsize lprt;
    if ( ( id = g_strstr_len(url+8,il,"/") ) != NULL )
    {
        lprt = id - url;
        cleaned = g_strndup(url,lprt);
    }
    else
        cleaned = g_strdup(url);
    return cleaned;
}

static gchar*
passwman_build_js( const gchar *url )
{
    gchar* script, *array;

    if ( log_pass && ( array = g_hash_table_lookup(log_pass,url) ) )
        script = g_strdup_printf("function getValue() { "
                                 "var values = new Array(%s);"
                                 "return values;"
                                 "};"
                                 "%s"
                                 "window.addEventListener('load',"
                                 "function() {PassMan.fillogpass(document);} , true);",
                                 array,
                                 jspassm);
    else
        script = NULL;
    return script;
}

static gboolean
passwman_navigation_decision_cb (WebKitWebView*             web_view,
                                 WebKitWebFrame*            web_frame,
                                 WebKitNetworkRequest*      request,
                                 WebKitWebNavigationAction* action,
                                 WebKitWebPolicyDecision*   decision,
                                 MidoriExtension*           extension)
{
    gchar* url;
    url = cleanurl( webkit_web_view_get_uri(web_view) );
    if ( log_pass )
    {
        gchar *array, *script;
        array = g_hash_table_lookup(log_pass,url);
        if ( array == NULL )
            script = g_strdup_printf ("function getValue() { "
                                      "var values = new Array();"
                                      "return values;"
                                      "};"
                                      "%s"
                                      "PassMan.dologpass(document);"
                                      "Store.dump();",
                                      jspassm);
        else
            script = g_strdup_printf ("function getValue() { "
                                      "var values = new Array(%s);"
                                      "return values;"
                                      "};"
                                      "%s"
                                      "PassMan.dologpass(document);"
                                      "Store.dump();",
                                      array,
                                      jspassm);
        if (webkit_web_navigation_action_get_reason (action) == \
             WEBKIT_WEB_NAVIGATION_REASON_FORM_SUBMITTED)
        {
            JSContextRef js_context = webkit_web_frame_get_global_context (web_frame);
            gchar* value = sokoke_js_script_eval (js_context, script, NULL);
            if (value && *value)
            {
                guint32 item_id;
                g_hash_table_insert(log_pass,g_strdup(url),g_strdup(value));
                if ( g_strcmp0(value,"\"0\"") == 0 )
                    gnome_keyring_set_network_password_sync(NULL,
                                                            "__never_store_here__",
                                                            "midori",
                                                            url,
                                                            NULL,
                                                            NULL,
                                                            NULL,
                                                            0,
                                                            "whatever",
                                                            &item_id);
                else
                {
                    gchar *id;
                    gchar **up;
                    gsize lprt;
                    id = g_strrstr(value,"\",\""); lprt = id-value;
                    id = g_strrstr_len(value,lprt,"\",\""); id += 3;
                    up = g_strsplit(id,"\"",4);
                    gnome_keyring_set_network_password_sync(NULL,
                                                            up[0],
                                                            "midori",
                                                            url,
                                                            NULL,
                                                            NULL,
                                                            NULL,
                                                            0,
                                                            up[2],
                                                            &item_id);
                    g_strfreev(up);
                }

                
            }
        }
        g_free(script);
    }
    g_free(url);
    return FALSE;
}

static void
passwman_window_object_cleared_cb (WebKitWebView*  web_view,
                                   WebKitWebFrame* web_frame,
                                   JSContextRef    js_context,
                                   JSObjectRef     js_window)
{
    gchar* url; gchar* script;
    url = cleanurl( webkit_web_view_get_uri(web_view) );
    script = passwman_build_js (url);
    if ( script ) {
        sokoke_js_script_eval (js_context, script, NULL);
        g_free (script);
    }
    g_free(url);
}

static void
passwman_add_tab_cb (MidoriBrowser*   browser,
                     MidoriView*      view,
                     MidoriExtension* extension)
{
    GtkWidget* web_view = midori_view_get_web_view (view);
    g_signal_connect (web_view, "window-object-cleared",
            G_CALLBACK (passwman_window_object_cleared_cb), NULL);
    g_signal_connect (web_view, "navigation-policy-decision-requested",
        G_CALLBACK (passwman_navigation_decision_cb), extension);
}

static void
passwman_deactivate_cb (MidoriExtension* extension,
                        MidoriBrowser*   browser);

static void
passwman_app_add_browser_cb (MidoriApp*       app,
                             MidoriBrowser*   browser,
                             MidoriExtension* extension)
{
    GList* tabs = midori_browser_get_tabs (browser);
    for (; tabs; tabs = g_list_next (tabs))
            passwman_add_tab_cb (browser, tabs->data, extension);
    g_list_free (tabs);
    g_signal_connect (browser, "add-tab",
            G_CALLBACK (passwman_add_tab_cb), extension);
    g_signal_connect (extension, "deactivate",
            G_CALLBACK (passwman_deactivate_cb), browser);
}

static void
passwman_deactivate_tab (MidoriView*      view,
                         MidoriExtension* extension)
{
    GtkWidget* web_view = midori_view_get_web_view (view);
    g_signal_handlers_disconnect_by_func (
       web_view, passwman_window_object_cleared_cb, extension);
    g_signal_handlers_disconnect_by_func (
       web_view, passwman_navigation_decision_cb, extension);
}

static void
passwman_deactivate_cb(MidoriExtension* extension,
                       MidoriBrowser*   browser)
{
    MidoriApp* app = midori_extension_get_app (extension);

    g_signal_handlers_disconnect_by_func (
       browser, passwman_add_tab_cb, extension);
    g_signal_handlers_disconnect_by_func (
        extension, passwman_deactivate_cb, browser);
    g_signal_handlers_disconnect_by_func (
        app, passwman_app_add_browser_cb, extension);
    GList* tabs = midori_browser_get_tabs (browser);
    for (; tabs; tabs = g_list_next (tabs))
       passwman_deactivate_tab (tabs->data, extension);
    g_list_free (tabs);

    katze_assign (jspassm, NULL);
    if (log_pass)
        g_hash_table_destroy (log_pass);
}

static void
passwman_activate_cb (MidoriExtension* extension,
                      MidoriApp*       app)
{
    KatzeArray* browsers;
    MidoriBrowser* browser;

    log_pass = g_hash_table_new_full (g_str_hash, g_str_equal,
                                      (GDestroyNotify)g_free,
                                      (GDestroyNotify)g_free);
    if ( !jspassm )
        passwman_prepare_js();
    GnomeKeyringResult res; GList *results; results = NULL;
    res = gnome_keyring_find_network_password_sync(NULL,
                                                   "midori",
                                                   NULL,
                                                   NULL,
                                                   NULL,
                                                   NULL,
                                                   0,
                                                   &results);
    if ( res == GNOME_KEYRING_RESULT_OK ) {
        GList *r; gchar *nlp; gchar *server; gchar *tmp;
        for( r = results; r; r = r->next ) {
            GnomeKeyringNetworkPasswordData* data = \
                             (GnomeKeyringNetworkPasswordData*)r->data;
            server = data->server;
            if ( g_strcmp0(data->user,"__never_store_here__") == 0 )
                nlp = g_strdup("\"0\"");
            else if ( ( tmp = g_hash_table_lookup(log_pass,server) ) )
            {
                if ( g_strcmp0(tmp,"\"0\"") == 0 )
                    nlp = g_strdup("\"0\"");
                else
                {
                    gssize il = -1; gchar *id, *num; gsize lprt, n;
                    id = g_strstr_len(tmp,il,","); lprt = id - tmp -1;
                    num = g_strndup(tmp+1,lprt); n = atoi(num)+1;
                    nlp = g_strdup_printf("\"%i\"%s,\"%s\",\"%s\"",n,id,\
                                          data->user,data->password);
                }
            }
            else
                nlp = g_strdup_printf("\"1\",\"%s\",\"%s\"",data->user,data->password);
            g_hash_table_insert(log_pass,g_strdup(server),nlp);
        }
        gnome_keyring_network_password_list_free(results);
    }
    browsers = katze_object_get_object (app, "browsers");
    KATZE_ARRAY_FOREACH_ITEM (browser, browsers)
        passwman_app_add_browser_cb (app, browser, extension);
    g_signal_connect (app, "add-browser",
        G_CALLBACK (passwman_app_add_browser_cb), extension);

    g_object_unref (browsers);
}

MidoriExtension*
extension_init (void)
{
    gboolean should_init = TRUE;
    const gchar* ver;
    gchar* desc;
    MidoriExtension* extension;

    if ( passwman_prepare_js() && gnome_keyring_is_available() )
    {
        ver = "0.3" MIDORI_VERSION_SUFFIX;
        desc = g_strdup (_("Stores login/password data"));
    }
    else
    {
        desc = g_strdup_printf (_("Not available: %s"),
                                _("Resource files or gnome-keyring"));
        ver = NULL;
        should_init = FALSE;
    }

    extension = g_object_new (MIDORI_TYPE_EXTENSION,
        "name", _("Password Manager"),
        "description", desc,
        "version", ver,
        "authors", "Giuseppe Borzi <gborzi@ieee.org>",
        NULL);
    g_free (desc);

    if (should_init)
        g_signal_connect (extension, "activate",
            G_CALLBACK (passwman_activate_cb), NULL);

    return extension;
}
