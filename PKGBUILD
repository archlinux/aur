# Maintainer: Felix Wang <wangzekun.felix@gmail.com>

pkgname=liz-desktop-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Liz: A cross-platform shortcut helper and auto-executor"
arch=('x86_64')
url="https://github.com/philia897/liz-desktop"
license=('GPL3')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1' 'xdotool')
options=('!strip' '!emptydirs')
install=.install
source_x86_64=("https://github.com/philia897/liz-desktop/releases/download/v$pkgver/liz_"$pkgver"_amd64.deb")
sha256sums_x86_64=('09c45b9a8adfa27841032d0365057f7ddabc4513f2f26af5d0604e3d643acbe4')

package() {
    tar -xz -f data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}
