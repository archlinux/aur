# Maintainer: jokester <me@jokester.io>

pkgname=awatcher-bundle-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="ActivityWatch-compatible activity and idle watchers, with bundled aw server"
arch=('x86_64')
url="https://github.com/2e3s/awatcher"
license=('MPL-2.0')
depends=()
source_x86_64=("https://github.com/2e3s/awatcher/releases/download/v0.3.1/awatcher_0.3.1-1_amd64.deb")
sha256sums_x86_64=("7f70109e91d86e002b83f218a2da17557eefa2b10fd05663b841f567f2354935")

package() {
  echo "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
  # sed -i 's|^Exec=.*|Exec=/usr/bin/element-desktop-nightly %U|' "${pkgdir}"/usr/share/applications/element-desktop-nightly.desktop
}
