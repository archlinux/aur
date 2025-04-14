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
sha256sums=('11ca572ef475de105ef6385749a72e4f8ec7cdac435d75c7481dc3490c72c4bc')

package() {
    chmod +x "${srcdir}/usr/share/ChatGTK/ChatGTK.py"
    chmod +x "${srcdir}/usr/share/applications/ChatGTK.desktop"
    cp -rf "${srcdir}/usr" "${pkgdir}"
}
