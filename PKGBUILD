# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Daniel Menelkir <dmenelkir at gmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='fontpreview'
pkgver=1.0.6
pkgrel=4
_commit=82533a6d76310737fcecf4694067ff5df5a5fc58
pkgdesc='Highly customizable and minimal font previewer written in bash'
arch=('any')
url='https://github.com/sdushantha/fontpreview'
license=('MIT')
depends=('fzf' 'imagemagick' 'nsxiv' 'xdotool')
makedepends=('git')
#source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
source=("${pkgname}::git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')

package() {
  cd "${pkgname}"
  install -Dvm755 "${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
