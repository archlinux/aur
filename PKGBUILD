# Maintainer: Erdem Goksel <erdem.goksel.dev at gmail dot com>

pkgname=seneka-ebdys-maltepe
pkgver=2026.07.23.17
pkgrel=4
pkgdesc="Maltepe University Seneka EBDYS ClickOnce client for Wine"
arch=('x86_64')
url="https://ebys.maltepe.edu.tr/"
license=('custom:proprietary')
depends=('bash' 'icoutils' 'wine' 'wine-gecko' 'winetricks' 'zenity')
source=(
  'seneka-ebdys'
  'seneka-ebdys-icon'
  'seneka-ebdys-setup'
  'seneka-ebdys-maltepe.desktop'
  'LICENSE.packaging'
  'LICENSE.upstream'
)
sha256sums=('ac1e7e290d0528d8f95f75fe8e776ea6ef885985242b3922a054f972444aa715'
            '2f8441f068eec4c46f186b30f95a28ceb0ae5c09a10b87e95a209019203cd7c4'
            'c7b8d41375675e0ca49c2b0519056a7591dfc6950c2a547021779d0f93c03085'
            '570f0d4f8ecfa5728c8c511adea4ba6db95c6d7c32351256b1eea96b4975ef09'
            'bf76c9891b73c19070faa6bfc15b5c5f711f0ff30e76c9feb93a18886305ec13'
            '66d8e494758b5cf1ec47a6c85310e05138a29e5268535f6289bd2beff0f13e9c')

package() {
  install -Dm755 seneka-ebdys "$pkgdir/usr/bin/seneka-ebdys"
  install -Dm755 seneka-ebdys-icon "$pkgdir/usr/bin/seneka-ebdys-icon"
  install -Dm755 seneka-ebdys-setup "$pkgdir/usr/bin/seneka-ebdys-setup"
  install -Dm644 seneka-ebdys-maltepe.desktop \
    "$pkgdir/usr/share/applications/seneka-ebdys-maltepe.desktop"
  install -Dm644 LICENSE.packaging \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.packaging"
  install -Dm644 LICENSE.upstream \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.upstream"
}
