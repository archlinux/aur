# Maintainer: Izzy Lerman (izzylerman14@gmail.com)
pkgname=aur-check
pkgver=1.0.0
pkgrel=1
pkgdesc="Quick safety checker for AUR packages"
arch=('any')
url="https://github.com/IzzyLerman/aur-check"
license=('MIT')
depends=('bash' 'curl' 'jq')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('20c2a130773e22fea4d9a66ac35ba8432ff4aaa192406b5df47387171467456c')  

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm755 aur-check.sh "$pkgdir/usr/bin/aur-check"
}
