# Maintainer: Morris Jobke <hey AT morrisjobke DOT de>

pkgname=gliderlabs-sigil
pkgver=0.4.0
pkgrel=1
pkgdesc='Standalone string interpolator and template processor'
arch=('x86_64')
url='https://github.com/gliderlabs/sigil'
license=('BSD')
# a package with the same name exists and provides a binary with the same name
conflicts=('sigil')

source=("https://github.com/gliderlabs/sigil/releases/download/v${pkgver}/sigil_${pkgver}_Linux_x86_64.tgz")
sha256sums=('c503bc15fba88d08fe7ba350fc02e61c4757d13f349f56cf5b7977f8139d5843')

package(){
  install -Dm 755 sigil "$pkgdir"/usr/bin/sigil
}
