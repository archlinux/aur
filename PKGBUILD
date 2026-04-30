# Maintainer: cap153 <1536989047@qq.com>

pkgname=lanchat-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="A cross-platform LAN chat software that supports file transfer, written in Rust."
arch=("x86_64")
url="https://github.com/cap153/LANChat"
license=('custom')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1' 'libappindicator' 'libayatana-appindicator')
source=("https://github.com/cap153/LANChat/releases/download/v0.1.3/LANChat_0.1.3_amd64.deb")
sha256sums=('SKIP')
options=('!strip')

package() {
  cd "$srcdir" || exit 1
	bsdtar -xf ${source[0]##*/}
	bsdtar -xf data.tar.gz -C "$pkgdir/"
}
# makepkg --printsrcinfo > .SRCINFO
