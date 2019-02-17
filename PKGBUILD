# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>
pkgname=publii
pkgver=0.33.1
pkgrel=1
pkgdesc="Publii is a desktop-based CMS for Windows, Mac and Linux that makes creating static websites fast and hassle-free, even for beginners"
arch=('x86_64')
url="https://github.com/GetPublii/Publii"
license=('MIT')
source=("https://cdn.getpublii.com/Publii_$pkgver.rpm")
sha256sums=('cb67ad1a73c7f796eeeffece004bbab0502be43c97cddbf3af64eb9bc6cfc4fb')

package() {
  bsdtar -xpf "${srcdir}/Publii_$pkgver.rpm" -C $pkgdir
}
