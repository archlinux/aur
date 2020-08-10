# Maintainer: orhun <orhunparmaksiz@gmail.com>
pkgname=zps-bin
pkgver=1.2.3
pkgrel=1
pkgdesc="A small utility for listing and cleaning up zombie processes"
arch=('x86_64')
url="https://github.com/orhun/zps"
license=('GPL3')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
source=("$url/releases/download/$pkgver/${pkgname%-bin}-$pkgver.tar.gz"{,.sig})
sha512sums=('13fa805228957b56a4849cee92814533648be843b5b8a29709c33b8c8e240922735439c6dc48832da6c182a3c5d50f7406a1c6a37f090502dd9eeebf4142a0b8'
            'SKIP')
validpgpkeys=('39E678DF63BE20EA5A175156B928720AEC532117') # orhun <orhunparmaksiz@gmail.com>

package() {
  install -Dt "$pkgdir/usr/bin/" "$srcdir/${pkgname%-bin}"
}