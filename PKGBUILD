# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgname=chatgqt
pkgver=2.0
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
sha256sums=('437d09370e0d4453060ea5451c570dda235cd2c96c315038abed27508680ed55')

package() {
    cp -rf "${srcdir}/usr" "${pkgdir}"
}
