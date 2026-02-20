# Maintainer: Zoe Wetzel <aur@commanderred.xyz>
pkgname=nvidia-driver-fixer

pkgver=1.0.0
pkgrel=1
pkgdesc="A systemd service unit to fix nvidia not loading correctly"

arch=('any')
license=('WTFPL')
depends=()

source=(
  "nvidia-driver-fixer.service"
)

sha256sums=('2a982db3336eb50defee1a04bc9580faca6720b39280b01c88cc6b106ddad8eb')

package() {
  cd "$srcdir/"

  install -D -m 644 "${srcdir}/nvidia-driver-fixer.service" "${pkgdir}/usr/lib/systemd/system/nvidia-driver-fixer.service"
}
