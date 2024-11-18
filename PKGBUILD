# Maintainer: Kainoa Kanter <kainoa@t1c.dev>
# Based on:
# - https://aur.archlinux.org/packages/anytype-electron-bin
# - https://aur.archlinux.org/packages/element-desktop-nightly-bin

pkgname=scalar-desktop-bin
pkgver=0.1.87
pkgrel=1
pkgdesc="Scalar on Desktop"
arch=('x86_64')
url="https://scalar.com/"
license=('custom')
depends=(bash glibc gcc-libs libsecret glib2 hicolor-icon-theme)
provides=('scalar-desktop')
source=(
        "scalar_v${pkgver}.deb::https://download.scalar.com/linux/deb/x64"
)
sha256sums=('d8c6dbd8fd765837cacdaf6bbe93ed2afd8313f9b2f9447cc044facefb584471')

package() {
  echo "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
