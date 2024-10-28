# Maintainer: envolution
# Contributor: Ryan Delaney <ryan.patrick.delaney@protonmail.com>

pkgname=ttf-inconsolata-g
pkgver=20090213
pkgrel=5
pkgdesc="Monospace font for pretty code listings and for the terminal modified by Leonardo Maffi http://www.fantascienza.net/leonardo/)"
arch=('any')
url='http://www.fantascienza.net/leonardo/'
license=('OFL-1.1')
source=("https://github.com/envolution/inconsolata-g/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3affd875b720421d9755e548422c40d80d13ff3a2f215db30b4918fb922e718b')

package(){
  cd inconsolata-g-${pkgver}
  install -Dm644 'inconsolata-g.otf' "${pkgdir}/usr/local/share/fonts/otf/inconsolata-g/inconsolata-g.otf"
  install -Dm644 'inconsolata-g.ttf' "${pkgdir}/usr/local/share/fonts/ttf/inconsolata-g/inconsolata-g.ttf"
  install -Dm644 'license.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
