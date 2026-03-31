# Maintainer: Kainoa Kanter <kainoa@t1c.dev>
# Based on:
# - https://aur.archlinux.org/packages/anytype-electron-bin
# - https://aur.archlinux.org/packages/element-desktop-nightly-bin

pkgname=scalar-desktop-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Scalar on Desktop"
arch=('x86_64')
url="https://scalar.com/"
license=('custom')
depends=(bash glibc gcc-libs libsecret glib2 hicolor-icon-theme)
provides=('scalar-desktop')
source=(
  "scalar_v${pkgver}.deb::https://download.scalar.com/versions/${pkgver}/linux/deb"
)
sha256sums=('0ca98c87a1a11c6126d08cce5e76ae3a7c76cdf1263230e88e69d2eb5de96170')

package() {
  echo "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
