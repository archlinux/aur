# Maintainer: Berke Oruc <berke@berkeai.com>
# Contributor: Berke Oruc <berke@berkeai.com>

pkgname=broslauncher
pkgver=1.0.7
pkgrel=1
epoch=
pkgdesc="Bros Virtual Machine Launcher - Bros HM-1 CPU Emulator"
arch=('x86_64')
url="https://bros.berkeai.com"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=('python-tk: For GUI')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("BrosLauncher-${pkgver}-x86_64.AppImage")
noextract=()
validpgpkeys=()

sha256sums=('SKIP')

package() {
  install -Dm755 "${startdir}/BrosLauncher-${pkgver}-x86_64.AppImage" "${pkgdir}/usr/bin/BrosLauncher"
  chmod +x "${pkgdir}/usr/bin/BrosLauncher"

  mkdir -p "${pkgdir}/usr/share/applications"
  cp "${startdir}/broslauncher.desktop" "${pkgdir}/usr/share/applications/"

  mkdir -p "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
  cp "${startdir}/broslauncher.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/broslauncher.png"
}