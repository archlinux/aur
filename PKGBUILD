# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=herokuish
pkgver=0.5.41
pkgrel=2
pkgdesc='Utility for emulating Heroku build and runtime tasks in containers'
arch=('x86_64')
url='https://github.com/gliderlabs/herokuish'
license=('MIT')
source=("${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_x86_64.tgz"
        "https://raw.githubusercontent.com/gliderlabs/herokuish/master/LICENSE")
sha256sums=('f062f7b99c6fd348d8e1597319b55957368c574655c855f3a3065ac2cbdb275f'
            '10265a1dd53faef4513b728a16b1eff3e5d5fc0bacc79e692ede34529bb8d1d1')

package() {
  install -Dm755 herokuish "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
