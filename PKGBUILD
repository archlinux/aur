pkgname=checkrestart
pkgver=1.0.2
pkgrel=2
pkgdesc="Arch Linux port of Debian's checkrestart utility"
url=https://github.com/sometoby/archlinux-checkrestart
arch=('any')
license=('GPL2')
depends=('lsof' 'python')
source=("https://github.com/sometoby/archlinux-checkrestart/archive/$pkgver.tar.gz")
sha256sums=('e7686ed9dfd97b705b6d1b4a1fd9df248b60d7e0d205a3b15aae6e785047bf60')

package() {
  cd "$pkgname-$pkgver"
  install -D ./checkrestart "${pkgdir}/usr/bin/checkrestart"
  install -D ./checkrestart.1 "${pkgdir}/usr/share/man/man1/checkrestart.1"
  gzip "${pkgdir}/usr/share/man/man1/checkrestart.1"
}
