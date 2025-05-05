# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgname=chatgqt
pkgver=1.0
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
sha256sums=('8c5773db324c5a8bdef1a40dade7ce24e7583fe596760ad8518f6ccef808f1fb')

package() {
    chmod +x "${srcdir}/usr/bin/chatgqt"
    chmod +x "${srcdir}/usr/share/applications/chatgqt.desktop"
    cp -rf "${srcdir}/usr" "${pkgdir}"
}
