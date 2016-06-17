# Maintainer:  <skrylar@ufo>
pkgname=loomer-aspect
pkgver=1.7.19
pkgrel=1
epoch=
pkgdesc="A virtual analogue synthesizer."
arch=('i686' 'x86_64')
url="http://www.loomer.co.uk/"
license=('proprietary')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source_x86_64=('http://www.loomer.co.uk/downloads/Aspect/Aspect_x86_64.tar.gz')
source_i686=('http://www.loomer.co.uk/downloads/Aspect/Aspect.tar.gz')
md5sums_i686=('63b41713fa7226a1392a1c39a2bd70ec')
md5sums_x86_64=('79f986b54b12a3fc23757b2983e46f91')

prepare() {
  tar -xzf *.tar.gz
}

package() {
  mkdir -p "$pkgdir/"usr/bin
  mkdir -p "$pkgdir/"usr/lib/vst
  mkdir -p "$pkgdir/"usr/share/doc/aspect
  install -o 0 -g 0 -m 755 Aspect/Aspect "$pkgdir/"usr/bin
  install -o 0 -g 0 -m 755 Aspect/AspectVST.so "$pkgdir/"usr/lib/vst
  install -o 0 -g 0 -m 644 Aspect/Aspect\ Manual.pdf "$pkgdir/"usr/share/doc/aspect
}

# vim:set ts=2 sw=2 et:
