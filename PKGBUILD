# Maintainer: Kainoa Kanter <kainoa@t1c.dev>
# Based on:
# - https://aur.archlinux.org/packages/anytype-electron-bin
# - https://aur.archlinux.org/packages/element-desktop-nightly-bin

pkgname=scalar-desktop-bin
pkgver=0.1.166
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
sha256sums=('6c850a7381392e3dbcf06dbcd2aff9d4569329f148249e9fe1c0828f3cff2d78')

package() {
  echo "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
