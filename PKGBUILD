# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>
pkgname=publii
pkgver=0.47.1
pkgrel=1
pkgdesc="Publii is a desktop-based CMS for Windows, Mac and Linux that makes creating static websites fast and hassle-free, even for beginners"
arch=('x86_64')
url="https://github.com/GetPublii/Publii"
license=('MIT')
source=("https://getpublii.com/download/Publii-$pkgver.rpm")
sha512sums=('6d17414c7fb2deb14bc2dc841a9098cbcabe7e0a71493c51627287aa5a9023063cfa58c0aadad3568c45193fed3f7916f8987c83739d8e5df4fe0d4d056aafbe')

package() {
  bsdtar -xpf "${srcdir}/Publii-$pkgver.rpm" -C $pkgdir
  [ -d $pkgdir/usr/lib/.build-id ] && rm -rf $pkgdir/usr/lib/.build-id
}
