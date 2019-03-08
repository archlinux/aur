# Maintainer: Harry Beadle <harry.beadle@gmail.com>

pkgname=vtr-git
pkgver=8.0
pkgrel=1
pkgdesc='Verilog to Routing'
arch=(x86_64)
url='https://verilogtorouting.org'
license=(MIT)
depends=(ctags)
makedepends=(cmake)
provides=(abc ace odin vpr)
conflicts=(vtr)
source=(git+https://github.com/verilog-to-routing/vtr-verilog-to-routing)
md5sums=('SKIP')

package() {
  cd vtr-verilog-to-routing/
  make
  install -D vpr/vpr "$pkgdir"/usr/bin/vpr
  install -D abc/abc "$pkgdir"/usr/bin/vpr
  install -D ace/ace "$pkgdir"/usr/bin/vpr
  install -D ODIN_II/odin_II "$pkgdir"/usr/bin/odin
}

