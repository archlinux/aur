# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgname=chatgtk
pkgver=1.1
pkgrel=2
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
sha256sums=('047bbbfa45834858c47d4a2f61658aad8dee07577d0409e40ab6741b6f34991e')

package() {
    chmod +x "${srcdir}/usr/share/ChatGTK/main.py"
    chmod +x "${srcdir}/usr/share/applications/ChatGTK.desktop"
    cp -rf "${srcdir}/usr" "${pkgdir}"
}
