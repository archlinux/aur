# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>
# Contributor: Morris Jobke <hey AT morrisjobke DOT de>

pkgname=herokuish
pkgver=0.5.11
pkgrel=2
pkgdesc='Utility for emulating Heroku build and runtime tasks in containers'
arch=('x86_64')
url='https://github.com/gliderlabs/herokuish'
license=('MIT')

source=("https://github.com/gliderlabs/herokuish/releases/download/v${pkgver}/herokuish_${pkgver}_linux_x86_64.tgz"
        'LICENSE')
sha256sums=('4ca72fdd486988aba371e13aa9e5668afc57553aae1b72d7b1a010ba49930adf'
            '10265a1dd53faef4513b728a16b1eff3e5d5fc0bacc79e692ede34529bb8d1d1')

package() {
  install -Dm 755 herokuish "${pkgdir}/usr/bin/herokuish"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/herokuish/LICENSE"
}
