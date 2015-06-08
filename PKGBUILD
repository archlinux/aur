# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=playbluray
pkgver=1.1
pkgrel=4
pkgdesc="Cross-Platform Blu-ray Playback Script"
arch=('any')
url="http://www.jaegertech.com/software/cross-platform-blu-ray-playback"
license=('unknown')
depends=('makemkv' 'vlc' 'curl')
source=("http://www.tophifi.it/ftp/packages/playBluRay.tgz")
sha256sums=('feeff80f445bb24e2ce5feb3bccf921ab0b1b854218377832c0f939ad0e340b1')

package() {
  tar xf playBluRay.tgz -C "$srcdir"
   install -Dm644 "$srcdir/playBluRay/playBluRay.sh" \
    "$pkgdir/usr/bin/playbluray.sh"
   install -Dm644 "$srcdir/playBluRay/playBluRay-icon.png" \
    "$pkgdir/usr/share/pixmaps/playbluray-icon.png"
   chmod +x "$pkgdir/usr/bin/playbluray.sh"
}