# Maintainer: Ildus Kurbangaliev <i.kurbangaliev@gmail.com>

pkgname=verible-bin
pkgver=0.0
pkgrel=1921
pkgdesc='SystemVerilog parser, linter, formatter and etc from Google'
arch=('x86_64')
url='https://github.com/google/verible'
license=('Apache License 2.0')
provides=('verible')

_githash='g348c1f8b'
source=("https://github.com/chipsalliance/verible/releases/download/v${pkgver}-${pkgrel}-${_githash}/verible-v${pkgver}-${pkgrel}-${_githash}-CentOS-7.9.2009-Core-x86_64.tar.gz")
sha512sums=('55fa95d2ca612e7c45e3912f1ef8df63e96b64f36c100095d625d12483baf6f1986acc4d27491bb088a4b0492f5179372a1856bbb8dcd1e556f632adbe1a4e8c')

package() {
  cd $srcdir/verible-v${pkgver}-${pkgrel}-${_githash}
  mkdir -p $pkgdir/usr/

  cp -R bin $pkgdir/usr/
  cp -R share $pkgdir/usr/
}
