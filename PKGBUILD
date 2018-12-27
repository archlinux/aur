# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=playbluray-makemkv
pkgver=1.2
pkgrel=2
pkgdesc="Blu-ray UHD Playback Script with makemkv and mpv"
arch=('any')
url="https://www.audio-linux.com"
license=('GPL')
depends=('makemkv' 'mpv' 'curl')
source=("https://www.audio-linux.com/ftp/packages/playbluray.tar.gz")
sha256sums=('SKIP')

package() {
  tar xf playbluray.tar.gz -C "$srcdir"
   install -Dm755 "$srcdir/playbluray/playbluray.sh" \
    "$pkgdir/usr/bin/playbluray.sh"
   install -Dm644 "$srcdir/playbluray/playbluray.png" \
    "$pkgdir/usr/share/pixmaps/playbluray.png"
    install -Dm644 "$srcdir/playbluray/Play Blu Ray.desktop" \
    "$pkgdir/usr/share/applications/Play Blu Ray.desktop"
   chmod +x "$pkgdir/usr/bin/playbluray.sh"
}
