# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgname=chatgtk
pkgver=1.0
pkgrel=1
pkgdesc="A simple ChatGPT Webview based on GTK, support system tray and nothing else"
arch=('any')
license=('GPLv3')
depends=(
    'python-gobject'
    'webkit2gtk'
    'libayatana-appindicator'
)
source=(
    'ChatGTK.tar.xz'
)
sha256sums=('a01d8cbcc0044a2a66eb319fd6a687e9bca35867bc65eae50656070c2f31fbad')

package() {
    chmod +x "${srcdir}/usr/share/ChatGTK/ChatGTK.py"
    chmod +x "${srcdir}/usr/share/applications/ChatGTK.desktop"
    cp -rf "${srcdir}/usr" "${pkgdir}"
}
