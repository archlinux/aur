# Maintainer: Kainoa Kanter <kainoa@t1c.dev>
# Based on:
# - https://aur.archlinux.org/packages/anytype-electron-bin
# - https://aur.archlinux.org/packages/element-desktop-nightly-bin

pkgname=scalar-desktop-bin
pkgver=0.1.73
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
sha256sums=('585eadd2bb6d80ec8c109c720391e7c2cbe6b744d5b7db7086e021b96b29faca')

package() {
  echo "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
