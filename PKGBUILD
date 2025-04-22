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
sha256sums=('8391bd33fc087efb2265a119cc6c22fb870fc4205abe7741961f631c0594a199')

package() {
    chmod +x "${srcdir}/usr/bin/chatgtk"
    chmod +x "${srcdir}/usr/share/applications/ChatGTK.desktop"
    cp -rf "${srcdir}/usr" "${pkgdir}"
}
