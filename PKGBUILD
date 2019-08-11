# Maintainer: Benjamin Winger <bmw@disroot.org>

_fullver=0.40-pre-release-2
pkgname=tes3cmd
pkgver=0.40_pre2
pkgrel=1
pkgdesc="A command line tool to examine and manipulate plugins for the game Morrowind"
provides=('tes3cmd')
conflicts=('tes3cmd')
arch=(any)
url="https://github.com/john-moonsugar/tes3cmd"
license=(MIT)
depends=('perl')
source=("https://github.com/john-moonsugar/tes3cmd/archive/v$_fullver.tar.gz")
sha512sums=('9ba1919eae8f572cfa58f9f1dccca9b2b2e24f2a0e4182139c3716b49ce645d69782053b70fb407d32dce2beb74068fd23b6fb8e14a276205630ac606edf6ecb')

package() {
  cd "$pkgname-$_fullver"
  install -Dm 755 tes3cmd -t "${pkgdir}/usr/bin"
}
