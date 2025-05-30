# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgname=chatgqt
pkgver=1.2
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
sha256sums=('0249ff9a82114ade989d9df0ef0dbdee556c02fbe13a75818a4bf7c02096bdf8')

package() {
    chmod +x "${srcdir}/usr/bin/chatgqt"
    chmod +x "${srcdir}/usr/share/applications/chatgqt.desktop"
    cp -rf "${srcdir}/usr" "${pkgdir}"
}
