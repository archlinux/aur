#!/bin/bash
# Replicates the essential Debian postinst setup for Dell OMSA so it works
# on Arch without dpkg. Run as root AFTER files are installed and after the
# ld.so.conf.d entry + compat libs are in place.
P=/opt/dell/srvadmin
arch=64
log() { echo "[omsa-setup] $*"; }

# Make the OMSA register-*.sh helpers find the vendored 2016-era libs.
export LD_LIBRARY_PATH="$P/omsa-compat:$P/lib64:$P/lib64/openmanage${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"

ldconfig

# 1. Build the OM registration config from all dropped fragments.
cat "$P"/etc/omreg.d/*.cfg > "$P"/etc/omreg.cfg 2>/dev/null || true

# 2. Data engine ini files (postinst "configure" branch, fresh install).
for i in dcsndy dcdmdy dcemdy dcdady; do
    cp -f "$P/var/lib/deng-ini/${i}${arch}.ini" \
          "$P/etc/srvadmin-deng/ini/${i}${arch}.ini" 2>/dev/null || true
done
# Point the message registry at the shipped path.
mr="$P/etc/srvadmin-deng/ini/dcmrdy${arch}.ini"
if [ -f "$mr" ]; then
    grep -v binfilepath "$mr" > "${mr}.mod" 2>/dev/null || true
    echo "binfilepath=$P/etc/srvadmin-deng/msgreg" >> "${mr}.mod"
    mv -f "${mr}.mod" "$mr"
fi
[ -e "$P/lib64/srvadmin-deng/register-deng.sh" ] && { log "register-deng"; bash "$P/lib64/srvadmin-deng/register-deng.sh" || true; }

# 3. Instrumentation service (isvc).
cp -f "$P/var/lib/isvc-ini/dclrdy${arch}.ini" \
      "$P/etc/srvadmin-isvc/ini/dclrdy${arch}.ini" 2>/dev/null || true
[ -e "$P/lib64/srvadmin-isvc/register-isvc.sh" ] && { log "register-isvc"; bash "$P/lib64/srvadmin-isvc/register-isvc.sh" || true; }
[ ! -e /usr/share/pci.ids ] && [ -e /usr/share/hwdata/pci.ids ] && ln -sf /usr/share/hwdata/pci.ids /usr/share/pci.ids

# 4. omacore registration.
[ -e "$P/lib64/srvadmin-omacore/register-omacore.sh" ] && { log "register-omacore"; bash "$P/lib64/srvadmin-omacore/register-omacore.sh" || true; }
[ -e "$P/lib64/srvadmin-omacore/register-omhip.sh" ] && { log "register-omhip"; bash "$P/lib64/srvadmin-omacore/register-omhip.sh" || true; }

# 5. storelib symlinks (versioned -> unversioned).
ln -sf "$P/lib64/libstorelib.so.4.62-0"      "$P/lib64/libstorelib.so"
ln -sf "$P/lib64/libstorelibir.so.5.07-0"    "$P/lib64/libstorelibir.so"
ln -sf "$P/lib64/libstorelibir-2.so.20.02-0" "$P/lib64/libstorelibir-2.so"
ln -sf "$P/lib64/libstorelibir-3.so.12.55-0" "$P/lib64/libstorelibir-3.so"

# 6. libsysfs for storelib (Debian used update-alternatives; we symlink directly).
mkdir -p /opt/lsi/3rdpartylibs/x86_64
for s in libsysfs.so libsysfs.so.2; do
    ln -sf /usr/lib/libsysfs.so.2 "/opt/lsi/3rdpartylibs/x86_64/$s"
done

# 7. storage registration.
[ -e "$P/lib64/srvadmin-storage/register-storage.sh" ]     && { log "register-storage"; bash "$P/lib64/srvadmin-storage/register-storage.sh" "" || true; }
[ -e "$P/lib64/srvadmin-storage/register-storage-cli.sh" ] && { log "register-storage-cli"; bash "$P/lib64/srvadmin-storage/register-storage-cli.sh" || true; }

# Rebuild omreg.cfg after all registrations, refresh linker cache.
cat "$P"/etc/omreg.d/*.cfg > "$P"/etc/omreg.cfg 2>/dev/null || true
ldconfig
log "done"
