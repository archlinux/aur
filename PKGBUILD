# Maintainer: NekoLOvO <nekolying@gmail.com>

pkgname=gemini-qt
pkgver=1.1
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
sha256sums=('06b4a8d6775e5ec9a2351f868d11a7daacbfa5f510751293a2dee174c74289b1')

package() {
    cp -rf "${srcdir}/usr" "${pkgdir}/"
}
