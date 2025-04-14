# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgname=chatgtk
pkgver=1.0
pkgrel=2
pkgdesc="A simple ChatGPT Webview Client based on GTK, support system tray and nothing else"
arch=('any')
license=('GPLv3')
depends=(
    'python-gobject'
    'webkit2gtk'
    'libappindicator-gtk3'
)
source=(
    'ChatGTK.tar.xz'
)
sha256sums=('7145862a2ec726ace46fefd10f2471b045afddf53ea2ff4a712667a3e8e5a609')

package() {
    chmod +x "${srcdir}/usr/share/ChatGTK/main.py"
    chmod +x "${srcdir}/usr/share/applications/ChatGTK.desktop"
    cp -rf "${srcdir}/usr" "${pkgdir}"
}
