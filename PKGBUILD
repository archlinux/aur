# Maintainer: Gomasy <nyan@gomasy.jp>

pkgname=libvdpau-va-gl-i965
pkgver=1
pkgrel=2
pkgdesc="VDPAU driver with OpenGL/VAAPI backend for i965 chipset"
arch=('any')
license=('none')
url="https://bbs.archlinux.org/viewtopic.php?id=186501"
depends=('libvdpau-va-gl' 'libva-intel-driver' 'libva-utils' 'intel-gpu-tools' 'vdpauinfo')

package() {
  install -d $pkgdir/usr/lib
  ln -s ./vdpau/libvdpau_va_gl.so.1 $pkgdir/usr/lib/libvdpau_i965.so
}
