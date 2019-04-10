# Maintainer: Darku <darkwav @ protonmail . com>
pkgname=lvm-order-patch
pkgver=1.0.0
pkgrel=1
pkgdesc="[DEPRECATED] Adds missing order functionality to lvm2 service files. Do not install this patch anymore, the patch was adopted upstream."
arch=('any')
license=('LGPL3')
package()
{
  mkdir "${pkgdir}/usr"
  mkdir "${pkgdir}/usr/lib"
  mkdir "${pkgdir}/usr/lib/systemd"
  mkdir "${pkgdir}/usr/lib/systemd/system"
  mkdir "${pkgdir}/usr/lib/systemd/system/lvm2-lvmetad.service.d"
  echo "[Unit]" > ${pkgdir}/usr/lib/systemd/system/lvm2-lvmetad.service.d/lvm-order-patch.conf
  echo "Before=shutdown.target" >> ${pkgdir}/usr/lib/systemd/system/lvm2-lvmetad.service.d/lvm-order-patch.conf
}
