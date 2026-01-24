# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>
pkgname=publii
pkgver=0.47.5
pkgrel=1
pkgdesc="Publii is a desktop-based CMS for Windows, Mac and Linux that makes creating static websites fast and hassle-free, even for beginners"
arch=('x86_64')
url="https://github.com/GetPublii/Publii"
license=('MIT')
source=("https://getpublii.com/download/Publii-$pkgver.rpm")
sha512sums=('7d16d21ddd815d1365de338322faa442b203200b2100cf0fa290eb75cd179f879012d00ff7dfdf59fa6f67c9f5cb6787566024604e76d4bb270a25309f1aae8f')

package() {
  bsdtar -xpf "${srcdir}/Publii-$pkgver.rpm" -C $pkgdir
  [ -d $pkgdir/usr/lib/.build-id ] && rm -rf $pkgdir/usr/lib/.build-id
}
