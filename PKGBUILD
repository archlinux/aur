# Maintainer : Liudas Alisauskas <liudas@akmc.lt>

pkgname=asus-n550jx-subwoofer-fix
pkgver=0.1
pkgrel=1
pkgdesc='Intel HDA driver fix for the ASUS N551JX laptop external subwoofer'
arch=('i686' 'x86_64')
license=('MIT')
depends=('linux')
makedepends=()
source=("snd-hda-intel-n550jx.conf" "n550jx-lfe-fix")
sha256sums=('5ebb64ec7a2d2ceaba45845db74bc3564ee9de4a0055980fcf75d7b811d9951c'
            '1e0d51b593e83f42025c45a0c60b8d25a87481dab59b7b34365fe0fcfc42cf75')
 
package() {
  install -Dm644 "${srcdir}/snd-hda-intel-n550jx.conf" "${pkgdir}/etc/modprobe.d/snd-hda-intel-n550jx.conf"
  install -Dm644 "${srcdir}/n550jx-lfe-fix" "${pkgdir}/usr/lib/firmware/n550jx-lfe-fix"
}
