pkgname=wasma
pkgver=1.3.0_beta
pkgrel=1
pkgdesc="Windows Assigment System Monitoring Advanced"
arch=('x86_64' 'aarch64')
url="https://github.com/Azencorporation/Wasma"
license=('Apache-2.0')

source_x86_64=(
  "wasma.tar.gz::https://github.com/Azencorporation/Wasma/releases/download/v1.3.0-beta-release/wasma-linux-platform-general-beta_amd64.tar.gz"
)

source_aarch64=(
  "wasma.tar.gz::https://github.com/Azencorporation/Wasma/releases/download/v1.3.0-beta-release/wasma-linux-platform-general-beta_arm64.tar.gz"
)

sha256sums=('SKIP')

package() {
  cd "$srcdir"

  install -Dm755 wasma "$pkgdir/usr/bin/wasma"
  install -Dm755 wasma-ubin "$pkgdir/usr/bin/wasma-ubin"
  install -Dm755 wasma_backend "$pkgdir/usr/bin/wasma_backend"
  install -Dm755 waylandbackend "$pkgdir/usr/bin/waylandbackend"
  install -Dm755 wsdg-env "$pkgdir/usr/bin/wsdg-env"
  install -Dm755 wsdg-open "$pkgdir/usr/bin/wsdg-open"
  install -Dm755 x11-backend "$pkgdir/usr/bin/x11-backend"
}
