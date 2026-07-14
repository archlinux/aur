# Maintainer: Philipp Wagner <philipp@wagnersnetz.de>
pkgname=kst4contest-bin
pkgver=1.41.1
pkgrel=1
pkgdesc="ON4KST Chat Client for VHF/UHF contest operation (pre-built)"
arch=('x86_64')
url="https://github.com/praktimarc/kst4contest"
license=('GPL-3.0-only')
depends=('gst-plugins-base' 'gst-plugins-good')
provides=('kst4contest')
conflicts=('kst4contest' 'kst4contest-git')
source=("KST4Contest-v${pkgver}-archlinux-${CARCH}.pkg.tar.zst::https://github.com/praktimarc/kst4contest/releases/download/v${pkgver}/KST4Contest-v${pkgver}-archlinux-${CARCH}.pkg.tar.zst")
sha256sums=('8e9a53ff832920c9ef2733635b90c5a4ffcd57a2958aaa251e92bd031142c614')

package() {
    cp -a "${srcdir}/usr" "${pkgdir}/"
}
