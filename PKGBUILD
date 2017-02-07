# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=pacolog
pkgver=1.1.3
pkgrel=1
pkgdesc='List recent commits for Arch Linux packages'
url='https://github.com/protist/pacolog'
arch=('any')
license=('GPL3')
depends=('w3m')
conflicts=('paclog')

source=("https://github.com/protist/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('7b3b1a13da35af5c8fa2d80ea176924460ebbae13bcf79b6a6c109c7649de0f5')

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 ${pkgname} "$pkgdir/usr/bin/${pkgname}"
}
