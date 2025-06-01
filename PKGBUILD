# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgname=chatgqt
pkgver=2.0
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
sha256sums=('23eacc644e2d08969b7c4bb9c9d1b14351d553565f6946bd16fb7132fe6caf12')

package() {
    cp -rf "${srcdir}/usr" "${pkgdir}/"
}
