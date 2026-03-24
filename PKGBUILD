# Maintainer: NekoLOvO <nekolying@gmail.com>

pkgname=gemini-qt
pkgver=1.0
pkgrel=1
pkgdesc="A simple Gemini Webview Client based on QT"
arch=('any')
license=('GPLv3')
depends=(
    'python-pyqt6-webengine'
    'python-dbus'
)
source=(
    'Gemini-Qt.tar.gz'
)
sha256sums=('2ec83f883ddfa114c4d2a2c0cfcffe47935a3a29497d4632618850888668e641')

package() {
    cp -rf "${srcdir}/usr" "${pkgdir}/"
}
