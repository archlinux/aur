# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Contributor: Joshua Stiefer <facedelajunk@gmail.com>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
# Contributor: scj <scj archlinux us>

pkgname=dnuos
pkgver=1.0.11
pkgrel=4
pkgdesc='Music library list creator'
arch=(any)
url='http://bitheap.org/dnuos'
license=('GPL')
depends=('python2')
source=("http://bitheap.org/dnuos/files/$pkgname-$pkgver.tar.gz")
md5sums=('bbd14149547c527086624cf55f852d69')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}

# vim:set ts=2 sw=2 et:
