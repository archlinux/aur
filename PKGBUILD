# Maintainer: Philipp Wagner <philipp@wagnersnetz.de>
pkgname=kst4contest-bin
pkgver=1.44.0
pkgrel=1
pkgdesc="ON4KST Chat Client for VHF/UHF contest operation (pre-built)"
arch=('x86_64')
url="https://github.com/praktimarc/kst4contest"
license=('GPL-3.0-only')
depends=('gst-plugins-base' 'gst-plugins-good')
provides=('kst4contest')
conflicts=('kst4contest' 'kst4contest-git')
source=("KST4Contest-v${pkgver}-archlinux-${CARCH}.pkg.tar.zst::https://github.com/praktimarc/kst4contest/releases/download/v${pkgver}/KST4Contest-v${pkgver}-archlinux-${CARCH}.pkg.tar.zst")
sha256sums=('62688fabc25be32ebe71588eb90f0334cfb7ddde14ba1be6df9956ff4415ddf0')

package() {
    cp -a "${srcdir}/usr" "${pkgdir}/"
}
