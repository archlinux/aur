# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=herokuish
pkgver=0.5.30
pkgrel=1
pkgdesc='Utility for emulating Heroku build and runtime tasks in containers'
arch=('x86_64')
url='https://github.com/gliderlabs/herokuish'
license=('MIT')

source=("https://github.com/gliderlabs/herokuish/releases/download/v${pkgver}/herokuish_${pkgver}_linux_x86_64.tgz"
        'LICENSE')
sha256sums=('42e1cc06d70367f42f2988e0144ab4490f1938b3260902789b102269c6211b64'
            '10265a1dd53faef4513b728a16b1eff3e5d5fc0bacc79e692ede34529bb8d1d1')

package() {
  install -Dm 755 herokuish "${pkgdir}/usr/bin/herokuish"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/herokuish/LICENSE"
}
