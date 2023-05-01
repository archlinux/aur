# Maintainer: bluetail  <a minus development plus archpkg at posteo dot de>

pkgname=btdu-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="sampling disk usage profiler for btrfs"
arch=('x86_64' 'aarch64')
url="https://github.com/CyberShadow/btdu/"
license=('GNU General Public License v2.0')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source_x86_64=("btdu::https://github.com/CyberShadow/btdu/releases/download/v${pkgver}/btdu-static-x86_64")
source_aarch64=("btdu::https://github.com/CyberShadow/btdu/releases/download/v${pkgver}/btdu-glibc-aarch64")

sha256sums_x86_64=('aea4b88e59990e37bf7fb3568919e6c41e510840375ca1adfd981ebbcbea608d')
sha256sums_aarch64=('aea4b88e59990e37bf7fb3568919e6c41e510840375ca1adfd981ebbcbea608d')

package() {
        cd "$srcdir" || exit
        install -D -m+x btdu "$pkgdir/usr/bin/btdu"
}
