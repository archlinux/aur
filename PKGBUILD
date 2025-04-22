# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgname=chatgtk
pkgver=1.2
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
sha256sums=('c93f86f37a633429bbd8e8c62f7ea05efd9e58a15b28854a67200cb65767fc02')

package() {
    chmod +x "${srcdir}/usr/bin/chatgtk"
    chmod +x "${srcdir}/usr/share/applications/ChatGTK.desktop"
    cp -rf "${srcdir}/usr" "${pkgdir}"
}
