# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

pkgname=ttf-roboto-flex
pkgver=3.200
pkgrel=1
epoch=1
pkgdesc="Upgrades Roboto to become a more powerful typeface system"
url="https://github.com/googlefonts/roboto-flex"
arch=(any)
license=(custom:OFL)
source=("$url/releases/download/$pkgver/roboto-flex-fonts.zip"
        "$url/raw/main/OFL.txt")
sha256sums=('0f66ef8a6412cdbd186822e671c0d960c2f487a4dac980e1b35d31ac8f06b2c9'
            '454ec26838f2b8f2e2588e759dd3742577e0d305d3359a7b81c86641fcab7d21')

package() {
  cd roboto-flex-fonts/

  install -Dm644 fonts/variable/*.ttf "$pkgdir"/usr/share/fonts/TTF/RobotoFlex-VF.ttf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 ../OFL.txt
}
