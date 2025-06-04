# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgname=chatgqt
pkgver=2.1
pkgrel=1
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
sha256sums=('6b686f8cb0117765b875b2597a24b2a4124ce799fb8443c34981ca2b74075fa1')

package() {
    cp -rf "${srcdir}/usr" "${pkgdir}/"
}
