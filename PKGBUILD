# Maintainer: Kainoa Kanter <kainoa@t1c.dev>
# Based on:
# - https://aur.archlinux.org/packages/anytype-electron-bin
# - https://aur.archlinux.org/packages/element-desktop-nightly-bin

pkgname=scalar-desktop-bin
pkgver=0.1.238
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
sha256sums=('1bea29bd9e8021e146692451acd4304f220aaaf20d8614ea9ac5721b841071ad')

package() {
  echo "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
