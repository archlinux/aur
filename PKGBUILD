# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>
pkgname=publii
pkgver=0.43.1
pkgrel=1
pkgdesc="Publii is a desktop-based CMS for Windows, Mac and Linux that makes creating static websites fast and hassle-free, even for beginners"
arch=('x86_64')
url="https://github.com/GetPublii/Publii"
license=('MIT')
source=("https://getpublii.com/download/Publii-$pkgver.rpm")
sha512sums=('2e11c80c394c4b9765bdd0d74631eae8c870244df7ea4989d9423e2f7af6ec49814cafedace8fa7d302cd18e3b1a90d4f702345cb07b3955b09e755d5a26faba')

package() {
  bsdtar -xpf "${srcdir}/Publii-$pkgver.rpm" -C $pkgdir
  [ -d $pkgdir/usr/lib/.build-id ] && rm -rf $pkgdir/usr/lib/.build-id
}
