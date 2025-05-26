# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgname=chatgqt
pkgver=1.1
pkgrel=3
pkgdesc="A simple ChatGPT Webview Client based on QT"
arch=('any')
license=('GPLv3')
depends=(
    'python-pyqt6-webengine'
    'python-dbus'
)
source=(
    'ChatGQT.tar.gz'
)
sha256sums=('0692d0b6eded2ebb8f224718b578d50093caf429cc37012f754ffad0ae6908c8')

package() {
    chmod +x "${srcdir}/usr/bin/chatgqt"
    chmod +x "${srcdir}/usr/share/applications/chatgqt.desktop"
    cp -rf "${srcdir}/usr" "${pkgdir}"
}
