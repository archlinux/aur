# Maintainer: Jan Sonntag <jaso35 at gmail dot com>

pkgname=asciigraph-bin
pkgver=0.5.5
pkgrel=1
pkgdesc="Go package to make lightweight ASCII line graph ╭┈╯ in command line apps with no other dependencies"
arch=('x86_64')
url='https://github.com/guptarohit/asciigraph'
license=('BSD')
provides=('asciigraph')
conflicts=('asciigraph')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/guptarohit/asciigraph/releases/download/v${pkgver}/asciigraph_${pkgver}_Linux_${arch}.tar.gz")
sha256sums=('549d2275af7c35d7482ce73e124a66168b3d410f46cdd73447170300c745875e')

package() {
  install -Dm755 asciigraph "${pkgdir}/usr/bin/asciigraph"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/asciigraph/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/asciigraph/README.md"
}
