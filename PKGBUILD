# Maintainer: Felix Wang <wangzekun.felix@gmail.com>

pkgname=liz-desktop-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Liz: A cross-platform shortcut helper and auto-executor"
arch=('x86_64')
url="https://github.com/philia897/liz-desktop"
license=('GPL3')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1' 'xdotool')
options=('!strip' '!emptydirs')
install=.install
source_x86_64=("https://github.com/philia897/liz-desktop/releases/download/v$pkgver/liz-desktop_"$pkgver"_amd64.deb")
sha256sums_x86_64=('8e17a6e0b04e99e950c48bf8610de728112c97c399979f55cf493f2c3feb8f6f')

package() {
    tar -xz -f data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}
