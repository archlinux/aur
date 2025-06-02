# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgname=chatgtk
pkgver=1.2
pkgrel=3
pkgdesc="A simple ChatGPT Webview Client based on GTK, support system tray and nothing else"
arch=('any')
license=('GPLv3')
depends=(
    'python-gobject'
    'webkit2gtk-4.1'
    'libappindicator-gtk3'
)
source=(
    'ChatGTK.tar.xz'
)
sha256sums=('7c81839862c891c7276d703123977f8c3e2f5873521b4e215471ac010c5697ea')

package() {
    cp -rf "${srcdir}/usr" "${pkgdir}/"
}
