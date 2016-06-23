# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=pacolog
pkgver=1.1.2
pkgrel=1
pkgdesc='List recent commits for Arch Linux packages'
url='https://github.com/protist/pacolog'
arch=('any')
license=('GPL3')
depends=('w3m')
conflicts=('paclog')

source=("https://github.com/protist/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b5878de879a7603cea26ec49cc2a23b5d42f10be89b968f71f4e29415df8b734')

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 ${pkgname} "$pkgdir/usr/bin/${pkgname}"
}
