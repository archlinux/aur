# Maintainer: Shu Takayama <syu.takayama(at)gmail.com>
# Contributor: yuhr <sdn.pate(at)gmail.com>

pkgname=ttf-cica
pkgver=5.0.3
pkgrel=1
pkgdesc="A Japanese monospace font for programming"
url="https://github.com/miiton/Cica"
license=('custom')
arch=('any')
source=(https://github.com/miiton/Cica/releases/download/v${pkgver}/Cica_v${pkgver}.zip)
md5sums=('fd4a3328bac39cb1be00e43b6968eba3')

package() {
  cd ${srcdir}

  install -dm755 "${pkgdir}/usr/share/fonts/TTF"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -m644 *.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}
