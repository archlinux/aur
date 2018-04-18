# Contributed by ivoarch <ivkuzev@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de

pkgname=aurel
pkgver=0.9
pkgrel=1
pkgdesc="Search and download AUR packages from Emacs"
arch=('any')
url="https://github.com/alezost/aurel"
license=('GPL')
depends=('emacs-dash' 'emacs-bui')
makedepends=('git')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/alezost/aurel/archive/v0.9.tar.gz")
sha256sums=('58d2811c39f3455f81c39e29b8fbd59dc74aa2211e2202ebf38261d571740bb9')

package() {
  _pkg_emacs="$pkgdir/usr/share/emacs/site-lisp/"

  cd $pkgname-$pkgver
  install -d $_pkg_emacs
  cp *.el $_pkg_emacs
}
