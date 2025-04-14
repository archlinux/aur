# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgname=chatgtk
pkgver=1.0
pkgrel=2
pkgdesc="A simple ChatGPT Webview based on GTK, support system tray and nothing else"
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
sha256sums=('a7c4df8bb50776e72c503805f1fa30b0333c1c97f06ffb676639bf400aff29ea')

package() {
    chmod +x "${srcdir}/usr/share/ChatGTK/main.py"
    chmod +x "${srcdir}/usr/share/applications/ChatGTK.desktop"
    cp -rf "${srcdir}/usr" "${pkgdir}"
}
