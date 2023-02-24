# Maintainer: bluetail  <a minus development plus archpkg at posteo dot de>

pkgname=btdu-bin
pkgver=v0.5.0
pkgrel=1
pkgdesc="sampling disk usage profiler for btrfs"
arch=('x86_64' 'aarch64')
url="https://github.com/CyberShadow/btdu/"
license=('GNU General Public License v2.0')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source_x86_64=("btdu::https://github.com/CyberShadow/btdu/releases/download/${pkgver}/btdu-static-x86_64")
source_aarch64=("btdu::https://github.com/CyberShadow/btdu/releases/download/${pkgver}/btdu-glibc-aarch64")

sha256sums_x86_64=('c7296034fdfd8d1d08b495e7159658a41e1fce9a70f8aa3458e1ca0b21807278')
sha256sums_aarch64=('7ac3cca106b7f83759bd4c9b112e729ad44371440c9ebe14ae37288565a31f52')


package() {
        cd "$srcdir" || exit
        install -D -m+x btdu "$pkgdir/usr/bin/btdu"
}
