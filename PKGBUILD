# Maintainer: Taiki Sugawara <buzz.taiki@gmail.com>
pkgname=shdotenv
pkgver=0.14.0
pkgrel=1
pkgdesc="dotenv for shells with support for POSIX-compliant and multiple .env file syntax"
arch=('any')
url="https://github.com/ko1nksm/shdotenv"
license=('MIT')
depends=('gawk' 'sh')

source=("$pkgname-$pkgver.sh::https://github.com/ko1nksm/shdotenv/releases/download/v$pkgver/shdotenv")
sha256sums=('efa1c0aa7d59331c0823e8a3a56066db6088094052b00dae63694e046985d29e')

package() {
  install -Dm 755 $pkgname-$pkgver.sh "$pkgdir"/usr/bin/shdotenv
}

# vim:set ts=2 sw=2 et:
