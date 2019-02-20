extern int is_selinux_enabled(void)
{
  /* always return 0; this way we don't trigger any SELINUX calls */
  return 0;
}
