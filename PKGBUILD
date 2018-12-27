# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>
pkgname=publii
pkgver=0.32.4
pkgrel=1
pkgdesc="Publii is a desktop-based CMS for Windows, Mac and Linux that makes creating static websites fast and hassle-free, even for beginners"
arch=('x86_64')
url="https://github.com/GetPublii/Publii"
license=('MIT')
source=("https://cdn.getpublii.com/Publii_$pkgver.rpm")
sha256sums=('b558d404d83d4760b56efd5479dc35bb6658180ae7e68515e66a79e31f976bec')

package() {
  bsdtar -xpf "${srcdir}/Publii_$pkgver.rpm" -C $pkgdir
}
