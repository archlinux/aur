# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>
pkgname=publii
pkgver=0.31.3
pkgrel=1
pkgdesc="Publii is a desktop-based CMS for Windows, Mac and Linux that makes creating static websites fast and hassle-free, even for beginners"
arch=('i686' 'x86_64')
url="https://github.com/GetPublii/Publii"
license=('MIT')
source=("https://cdn.getpublii.com/Publii_$pkgver.rpm")
sha256sums=('0879c5f000455b1df57e183d8248b3981104b2fd2273c4b07c7b4298356c2d1a')

package() {
  bsdtar -xpf "${srcdir}/Publii_$pkgver.rpm" -C $pkgdir
}
