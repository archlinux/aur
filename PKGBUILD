# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=enginesound-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="Procedural engine sound generator controlled via GUI or CLI"
arch=('x86_64')
url="https://github.com/DasEtwas/enginesound/"
license=('MIT')
provides=('enginesound')
depends=('alsa-lib' 'gcc-libs')
source=("${pkgname}-${pkgver}::${url}releases/download/v${pkgver}/enginesound-x86_64-linux"
    'LICENSE::https://raw.githubusercontent.com/DasEtwas/enginesound/master/LICENSE')
noextract=("${pkgname}-${pkgver}")
sha256sums=('4ca67536ddea711a9bcff854cd4e5c2b1126dcf157185ef30f22f30d27edd5f8'
            'e62c3637dab3985bc36b73a985c05908e6dcf50a2f99cab02a45d944e7886c02')

package() {
  install -Dm755 enginesound* -t "${pkgdir}/usr/bin/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
