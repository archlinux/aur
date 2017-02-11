# Maintainer: Mort Yao <soimort@Verlangen>

pkgname=fstar-bin
pkgver=0.9.4.0
pkgrel=1
pkgdesc='A Higher-Order Effectful Language Designed for Program Verification'
url='https://fstar-lang.org/'
license=('Apache')
arch=('x86_64')
depends=('z3')
provides=('fstar')
conflicts=('fstar' 'fstar-git')
source=("https://github.com/FStarLang/FStar/releases/download/V${pkgver}/fstar_${pkgver}_Linux_x86_64.tar.gz")
md5sums=('cecda4d1de51fa515293bca7a545d6c2')

package() {
  cd "fstar"

  install -d -m755 $pkgdir/opt/fstar $pkgdir/usr/bin
  cp -r * $pkgdir/opt/fstar
  ln -s /opt/fstar/bin/fstar.exe $pkgdir/usr/bin/fstar
}
