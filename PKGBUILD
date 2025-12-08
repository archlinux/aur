# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>
pkgname=publii
pkgver=0.47.3
pkgrel=1
pkgdesc="Publii is a desktop-based CMS for Windows, Mac and Linux that makes creating static websites fast and hassle-free, even for beginners"
arch=('x86_64')
url="https://github.com/GetPublii/Publii"
license=('MIT')
source=("https://getpublii.com/download/Publii-$pkgver.rpm")
sha512sums=('7a626e9154ca355a9847d24482d0f8bb1a875519b225ceee13a9448fa571302f6f15c0dd068be191344ee00685955357c1369e05c622985df92d7e0f397133d2')

package() {
  bsdtar -xpf "${srcdir}/Publii-$pkgver.rpm" -C $pkgdir
  [ -d $pkgdir/usr/lib/.build-id ] && rm -rf $pkgdir/usr/lib/.build-id
}
