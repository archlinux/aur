# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgname=chatgqt
pkgver=1.2
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
sha256sums=('39e747476e2516c956e34553d260b4fa9f547b88139af1045ce34e47d1e42aae')

package() {
    chmod +x "${srcdir}/usr/bin/chatgqt"
    chmod +x "${srcdir}/usr/share/applications/chatgqt.desktop"
    cp -rf "${srcdir}/usr" "${pkgdir}"
}
