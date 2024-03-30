# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>
pkgname=publii
pkgver=0.45.2
pkgrel=1
pkgdesc="Publii is a desktop-based CMS for Windows, Mac and Linux that makes creating static websites fast and hassle-free, even for beginners"
arch=('x86_64')
url="https://github.com/GetPublii/Publii"
license=('MIT')
source=("https://getpublii.com/download/Publii-$pkgver.rpm")
sha512sums=('d7852fb7ff955d5a9fe5455fbf5389909c2992f563eac001756ea57812c761e682a5f526f2b83b5b7201bd5c20e84b9009704743b6423959584bbda032ef1106')

package() {
  bsdtar -xpf "${srcdir}/Publii-$pkgver.rpm" -C $pkgdir
  [ -d $pkgdir/usr/lib/.build-id ] && rm -rf $pkgdir/usr/lib/.build-id
}
