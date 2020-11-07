# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Julien Deswaef <juego@requiem4tv.com>

# otfinfo --info *.ttf

_pkgname='Fork-Awesome'
pkgbase="${_pkgname,,}"
pkgname="ttf-${_pkgname,,}"
pkgver=1.1.7
pkgrel=1
pkgdesc='Fork of the iconic Font Awesome font and CSS toolkit'
arch=('any')
url='https://forkaweso.me/Fork-Awesome/'
_url_source='https://github.com/ForkAwesome/Fork-Awesome'
license=('CCPL' 'MIT' 'OFL')
source=("${_pkgname}-${pkgver}.tar.gz::${_url_source}/archive/${pkgver}.tar.gz")
sha256sums=('94aff930bcb81871c91bc3167003b46c29e5939ca403dcb10e35b3e875132455')

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dvm644 'fonts/'*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSES' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
