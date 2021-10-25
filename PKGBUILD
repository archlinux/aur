# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=herokuish
pkgver=0.5.31
pkgrel=2
pkgdesc='Utility for emulating Heroku build and runtime tasks in containers'
arch=('x86_64')
url='https://github.com/gliderlabs/herokuish'
license=('MIT')
source=("${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_x86_64.tgz"
        'LICENSE')
sha256sums=('db6e341e885dd437500cc701a7a9342c9474fbc6d95819be991fdf9127faaf1e'
            '10265a1dd53faef4513b728a16b1eff3e5d5fc0bacc79e692ede34529bb8d1d1')

package() {
  cd "${srcdir}"

  install -Dm755 herokuish "${pkgdir}/usr/bin/${pkgname}"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
