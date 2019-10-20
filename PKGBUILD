# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-ht
pkgver=2.2
pkgrel=2
pkgdesc="The missing Emacs hash table library."
arch=('any')
url="https://github.com/Wilfred/ht.el"
license=('GPL3')
depends=('emacs-dash')
makedepends=('cask')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('ee4fd96f9e873a603265aa53a84d56bc88af0bb77b10bc1a7f4dc0dcde11513b')

package() {
  cd ht.el-$pkgver
  install -d "$pkgdir"/usr/share/emacs/site-lisp/
  install -m644 *.el "$pkgdir"/usr/share/emacs/site-lisp/
}
