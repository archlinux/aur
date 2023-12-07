# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

pkgname=ttf-roboto-flex
pkgver=3.200
pkgrel=2
epoch=1
pkgdesc="Upgrades Roboto to become a more powerful typeface system"
url="https://github.com/googlefonts/roboto-flex"
arch=(any)
license=(custom:OFL)
source=("roboto-flex-fonts-$pkgver.zip::$url/releases/download/$pkgver/roboto-flex-fonts.zip"
        "roboto-flex-fonts-$pkgver.txt::$url/raw/main/OFL.txt")
sha256sums=('6b2b14e11308c7d3e8388b623cf740c46b872e7519198e0cff8062e52b75239b'
            '454ec26838f2b8f2e2588e759dd3742577e0d305d3359a7b81c86641fcab7d21')

package() {
  cd roboto-flex-fonts/

  install -Dm644 fonts/variable/*.ttf "$pkgdir"/usr/share/fonts/TTF/RobotoFlex-VF.ttf
  install -Dm644 ../*.txt "$pkgdir/usr/share/licenses/$pkgname"/OFL.txt
}
