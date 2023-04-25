# Maintainer: Taiki Sugawara <buzz.taiki@gmail.com>
pkgname=shdotenv
pkgver=0.13.0
pkgrel=1
pkgdesc="dotenv for shells with support for POSIX-compliant and multiple .env file syntax"
arch=('any')
url="https://github.com/ko1nksm/shdotenv"
license=('MIT')
depends=('gawk' 'sh')

source=("$pkgname-$pkgver.sh::https://github.com/ko1nksm/shdotenv/releases/download/v$pkgver/shdotenv")
sha256sums=('16505e116e39a96719420858a344affec6e031033777f0d6d23cb97709df7537')

package() {
  install -Dm 755 $pkgname-$pkgver.sh "$pkgdir"/usr/bin/shdotenv
}

# vim:set ts=2 sw=2 et:
