# Maintainer: Nia Schlegel <nia@3nt3.de>

pkgname=ttf-instrument-sans
pkgver=1.0
pkgrel=1
pkgdesc='Instrument Sans, a variable sans-serif designed for the Instrument brand, and open-sourced for you on google fonts.'
arch=('any')
url='https://github.com/Instrument/instrument-sans'
license=('OFL-1.1')
_commit='7fa22308a3d0c94ee2b3cd537a1196b65db34a3e'
source=("$pkgname-$_commit.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('91cd1a95a15ca4fcac656b816b95d41edcae1c60c43aded5f8b0fbd3f5fa0286')

package() {
  cd "instrument-sans-$_commit"

  # Install font files
  install -Dm644 fonts/ttf/*.ttf -t "$pkgdir/usr/share/fonts/TTF/"

  # Install license
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
}
