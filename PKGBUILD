# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Joakim Reinert <mail@jreinert.com>
pkgname=hless-bin
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="less with syntax highlighting"
arch=('x86_64')
url="https://github.com/jreinert/hless"
license=('MIT')
depends=('python2-pygments')
provides=('hless')
conflicts=('hless-git')
source=("https://github.com/jreinert/hless/releases/download/v$pkgver/hless"{,.sig})
validpgpkeys=('26DCD9B1C4192A20C856D3A04D9F310E17204540') # Joakim Reinert
md5sums=('644fad8a09c3b9abffb7d39052a2598c'
         'SKIP')

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 hless "$pkgdir/usr/bin/hless"
}

# vim:set ts=2 sw=2 et:
