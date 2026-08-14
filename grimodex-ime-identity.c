/*
 * fcitx5-gtk derives InputContext::program from GLib's g_get_prgname().
 * Electron initializes that value as "electron" before application code can
 * replace it. The Arch package adds this tiny interposer to Electron's ELF
 * dependencies so every Grimodex subprocess retains the strict app scope.
 */
__attribute__((visibility("default")))
const char *g_get_prgname(void) {
  return "grimodex";
}
