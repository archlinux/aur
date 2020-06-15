# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: jason ryan <jasonwryan@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=bash-docs
pkgver=10
pkgrel=2
pkgdesc="Advanced Bash-Scripting Guide in HTML"
arch=('any')
url="http://tldp.org/LDP/abs/html/"
license=('custom')
options=('docs')
source=("http://www.tldp.org/LDP/abs/abs-guide.html.tar.gz")
sha256sums=('e543941dc1d32689fca9da49ab89dc5f11f1655937a10afc6b3a414ac4b2da9e')
install=$pkgname.install

package(){
  cd "$srcdir/abs-guide"
  install -d "$pkgdir"/usr/share/doc/bash
  cp -rf * "$pkgdir"/usr/share/doc/bash
  install -d "$pkgdir"/usr/share/licenses/$pkgname
}
