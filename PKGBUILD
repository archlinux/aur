# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=bash-docs
pkgver=10
pkgrel=1
pkgdesc="Advanced Bash-Scripting Guide in HTML"
arch=('any')
url="http://tldp.org/LDP/abs/html/"
license=('GPL')
options=('docs')
source=("http://www.tldp.org/LDP/abs/abs-guide.html.tar.gz")
md5sums=('7014ea02a91ada997373fd12053b4061')

package(){
  cd "$srcdir/abs-guide"
  install -d "$pkgdir"/usr/share/doc/bash
  cp -rf * "$pkgdir"/usr/share/doc/bash
}
