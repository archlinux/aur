# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>
pkgname=publii
pkgver=0.41.0
pkgrel=1
pkgdesc="Publii is a desktop-based CMS for Windows, Mac and Linux that makes creating static websites fast and hassle-free, even for beginners"
arch=('x86_64')
url="https://github.com/GetPublii/Publii"
license=('MIT')
source=("https://getpublii.com/download/Publii-$pkgver.rpm")
sha256sums=('d778b7b8decf80b113db25b59f9509e5742cb36764f3238958c0812a759a113c')

package() {
  bsdtar -xpf "${srcdir}/Publii-$pkgver.rpm" -C $pkgdir
}
