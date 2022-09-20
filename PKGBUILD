# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>
pkgname=publii
pkgver=0.40.3
pkgrel=1
pkgdesc="Publii is a desktop-based CMS for Windows, Mac and Linux that makes creating static websites fast and hassle-free, even for beginners"
arch=('x86_64')
url="https://github.com/GetPublii/Publii"
license=('MIT')
source=("https://getpublii.com/download/Publii-$pkgver.rpm")
sha256sums=('b0a7397cde794efa9561b3d417f2de579e50988f10c88320cef6dcc9ea8c3f01')

package() {
  bsdtar -xpf "${srcdir}/Publii-$pkgver.rpm" -C $pkgdir
}
