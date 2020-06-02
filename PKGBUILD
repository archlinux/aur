# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>
# Contributor: Morris Jobke <hey AT morrisjobke DOT de>

pkgname=herokuish
pkgver=0.5.14
pkgrel=1
pkgdesc='Utility for emulating Heroku build and runtime tasks in containers'
arch=('x86_64')
url='https://github.com/gliderlabs/herokuish'
license=('MIT')

source=("https://github.com/gliderlabs/herokuish/releases/download/v${pkgver}/herokuish_${pkgver}_linux_x86_64.tgz"
        'LICENSE')
sha256sums=('3ff06c2c2ef87bbedb92d2161de766c1166c75f467d9287964d087363a3c770f'
            '10265a1dd53faef4513b728a16b1eff3e5d5fc0bacc79e692ede34529bb8d1d1')

package() {
  install -Dm 755 herokuish "${pkgdir}/usr/bin/herokuish"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/herokuish/LICENSE"
}
