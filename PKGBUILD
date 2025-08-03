# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgname=chatgqt
pkgver=2.2
pkgrel=1
pkgdesc="A simple ChatGPT Webview Client based on QT"
arch=('any')
license=('GPLv3')
depends=(
    'python-pyqt6-webengine'
    'python-dbus'
)
optdepends=(
  'xdg-desktop-portal: Detect system theme on DEs supporting portals'
)
source=(
    'ChatGQT.tar.gz'
)
sha256sums=('d4bc15be3de3d98168c0ecdea9aa505e76d86df23cdda9e89ba164e43affcd1c')

package() {
    cp -rf "${srcdir}/usr" "${pkgdir}/"
}
