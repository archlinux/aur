# Maintainer: Momwhyareyouhere <momwhyareyouhere51@gmail.com>

pkgname=patch-bin
pkgver=1.0.4
pkgrel=2
pkgdesc="A lightweight code editor built with Electron, Monaco Editor, and React"
arch=('x86_64')
url="https://github.com/Momwhyareyouhere/Patch"
license=('MIT')
depends=('fuse2' 'libxss' 'libxtst' 'libxkbfile' 'nss' 'gtk3')
install="${pkgname}.install"
source=("https://github.com/Momwhyareyouhere/Patch/releases/download/v${pkgver}/Patch-${pkgver}.AppImage")
sha256sums=('SKIP')

package() {
  install -dm755 "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/Patch-${pkgver}.AppImage" "${pkgdir}/usr/bin/patch-editor"
}
