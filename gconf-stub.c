/* Minimal libgconf-2.so.4 stub for MailMaster */
void *gconf_client_get_default(void) { return 0; }
void gconf_client_add_dir(void *c, const char *d, int p, void *e) {}
void gconf_client_remove_dir(void *c, const char *d, void *e) {}
unsigned gconf_client_notify_add(void *c, const char *k, void *f, void *d, void *dn, void *e) { return 0; }
void gconf_client_notify_remove(void *c, unsigned id) {}
void *gconf_client_get(void *c, const char *k, void *e) { return 0; }
int gconf_client_get_int(void *c, const char *k, void *e) { return 0; }
char *gconf_client_get_string(void *c, const char *k, void *e) { return 0; }
void *gconf_client_get_list(void *c, const char *k, int t, void *e) { return 0; }
int gconf_client_get_bool(void *c, const char *k, void *e) { return 0; }
const char *gconf_entry_get_key(void *e) { return ""; }
void *gconf_entry_get_value(void *e) { return 0; }
void gconf_value_free(void *v) {}
int gconf_value_get_type(void *v) { return 0; }
int gconf_value_get_bool(void *v) { return 0; }
int gconf_value_get_int(void *v) { return 0; }
const char *gconf_value_get_string(void *v) { return ""; }
int gconf_init(int argc, char **argv, void *e) { return 1; }
void gconf_cleanup(void) {}
void gconf_unset(void *c, const char *k, void *e) {}
void gconf_set_bool(void *c, const char *k, int v, void *e) {}
void gconf_set_int(void *c, const char *k, int v, void *e) {}
void gconf_set_string(void *c, const char *k, const char *v, void *e) {}
void *gconf_schema_source_get_default(void) { return 0; }
void gconf_schema_source_free(void *s) {}
