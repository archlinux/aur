# Maintainer: Erdem Goksel <erdem.goksel.dev at gmail dot com>

pkgname=seneka-ebdys-maltepe
pkgver=2026.07.23.17
pkgrel=1
pkgdesc="Maltepe University Seneka EBDYS ClickOnce client for Wine"
arch=('x86_64')
url="https://ebys.maltepe.edu.tr/"
license=('custom:proprietary')
depends=('bash' 'wine' 'wine-gecko' 'winetricks' 'zenity')
source=(
  'seneka-ebdys'
  'seneka-ebdys-setup'
  'seneka-ebdys-maltepe.desktop'
  'seneka-ebdys-maltepe.svg'
  'LICENSE.packaging'
  'LICENSE.upstream'
)
sha256sums=('525fc94e6b2e2d96d572d09088feab2e2f55250c72a5cbd6dc56a5c2fb2dbb0a'
            '88f1b146110c17e6ad720ddf9722dbf83e078bc1c850ea5e05ea561420265f6d'
            '6240ed29b9aa4c4863133811c46e519520ac13ee3c9e62bd70df3b10ff93239e'
            'fe21570545d3c93f61517963a8bc100bc08095f6bb9d210cea81f687600c7e46'
            'bf76c9891b73c19070faa6bfc15b5c5f711f0ff30e76c9feb93a18886305ec13'
            '66d8e494758b5cf1ec47a6c85310e05138a29e5268535f6289bd2beff0f13e9c')

package() {
  install -Dm755 seneka-ebdys "$pkgdir/usr/bin/seneka-ebdys"
  install -Dm755 seneka-ebdys-setup "$pkgdir/usr/bin/seneka-ebdys-setup"
  install -Dm644 seneka-ebdys-maltepe.desktop \
    "$pkgdir/usr/share/applications/seneka-ebdys-maltepe.desktop"
  install -Dm644 seneka-ebdys-maltepe.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/seneka-ebdys-maltepe.svg"
  install -Dm644 LICENSE.packaging \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.packaging"
  install -Dm644 LICENSE.upstream \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.upstream"
}
