# Contributor: Hauke Wesselmann <hauke@h-dawg.de>
# Maintainer: Gianmarco Brocchi <brocchi@poisson.phc.unipi.it>
pkgname=emacs-yasnippet
pkgver=0.8.0
pkgrel=1
pkgdesc="Yet another snippet extension for Emacs."
arch=('any')
url="https://github.com/capitaomorte/yasnippet"
license=('MIT')
depends=('emacs')
source=(https://github.com/downloads/capitaomorte/yasnippet/yasnippet-$pkgver.tar.gz)
md5sums=('fa343adae588fde44b4ecf4f23c1e2d0')
options=()
install=yasnippet.install

build() {
  cd $srcdir/yasnippet-$pkgver
  install -d  $pkgdir/usr/share/emacs/site-lisp/yas
  cp -r * $pkgdir/usr/share/emacs/site-lisp/yas
}

