# Maintainer: Archfapper <archfapper@archlinux.org>
pkgname=legcord
pkgver=ed8ca6a
pkgrel=1
pkgdesc="A minimal custom client for Discord that keeps everything lightweight while using the official web app."
arch=('x86_64')
url="https://github.com/ArmCord/Legcord"
license=('MIT')
depends=('wget' 'python-pyqt5' 'python-pyqt5-webengine' 'webkit2gtk' 'python-cairo' 'cairo' 'python-pyqt5-webkit')

source=("https://github.com/ArmCord/Legcord/releases/download/${pkgver}/LegcordLinux")
md5sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/LegcordLinux-ed8ca6a" "${pkgdir}/opt/legcord/legcord"
    rm -f "${pkgdir}/LegcordLinux-ed8ca6a"
}
