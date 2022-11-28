# Maintainer: sc44 <fullpower1 at gmx dot de>

pkgname=streamrecorder
_pkgname=Stream-Recorder
pkgver=1.50
pkgrel=1
pkgdesc="Simple stream viewer and recorder"
url="https://github.com/sc44/Stream-Recorder"
arch=('any')
license=('GPL3')
depends=('python' 'tk' 'ffmpeg') 
optdepends=('mpv' 'smplayer' 'vlc' 'celluloid' 'mplayer' 'gnome-mplayer')
source=("https://github.com/sc44/Stream-Recorder/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('803a89b1cb072aec796996d45418f684036412aea1bedbfb8293f44336d92a9f')
package() {
  cd "$srcdir"/"$_pkgname"-"$pkgver"
  install -Dm 755 srecorder.py "$pkgdir/usr/bin/srecorder.py"
  install -Dm 644 srecorder.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm 644 srecorder.png -t "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
}
