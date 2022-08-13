# Maintainer: sc44 <fullpower1 at gmx dot de>

pkgname=streamrecorder
_pkgname=Stream-Recorder
pkgver=1.45
pkgrel=1
pkgdesc="Simple stream viewer and recorder"
url="https://github.com/sc44/Stream-Recorder"
arch=('any')
license=('GPL3')
depends=('python' 'tk' 'ffmpeg') 
optdepends=('mpv' 'smplayer' 'vlc' 'celluloid' 'mplayer' 'gnome-mplayer')
source=("https://github.com/sc44/Stream-Recorder/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3dea0913eec51825574c0f141702a4342b50a3c8a7fa1f6f50f4a888949af1e2')
package() {
  cd "$srcdir"/"$_pkgname"-"$pkgver"
  install -Dm 755 srecorder.py "$pkgdir/usr/bin/srecorder.py"
  install -Dm 644 srecorder.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm 644 srecorder.png -t "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
}
