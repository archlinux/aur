# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgname=chatgqt
pkgver=1.0
pkgrel=2
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
sha256sums=('fb3eba7377a574d6ea2c704f58629f26075a354b3b59dbd02bc4c7a62036ce8c')

package() {
    chmod +x "${srcdir}/usr/bin/chatgqt"
    chmod +x "${srcdir}/usr/share/applications/chatgqt.desktop"
    cp -rf "${srcdir}/usr" "${pkgdir}"
}
