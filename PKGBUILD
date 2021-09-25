# Maintainer: Amy Wilson <awils_1 at xsmail dot com
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Julien Deswaef <juego@requiem4tv.com>

# otfinfo --info *.ttf

_pkgname='Fork-Awesome'
pkgbase="${_pkgname,,}"
pkgname="ttf-${_pkgname,,}"
pkgver=1.2.0
pkgrel=2
pkgdesc='Fork of the iconic Font Awesome font and CSS toolkit'
arch=('any')
url='https://forkaweso.me/Fork-Awesome/'
_url_source='https://github.com/ForkAwesome/Fork-Awesome'
license=('CCPL' 'MIT' 'OFL')
source=("${_pkgname}-${pkgver}.tar.gz::${_url_source}/archive/${pkgver}.tar.gz")
sha256sums=('23fba5f191f204e0414c547bf4c9b10fd7ca42c151260e8f64698449a75fbdb3')

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dvm644 'fonts/'*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSES' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
