# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=bluegriffon2
pkgver=2.1.1
pkgrel=1
pkgdesc="The next-generation Web Editor based on the rendering engine of Firefox"
arch=('x86_64')
url="http://www.bluegriffon.com"
license=('MPL' 'GPL' 'LGPL')
depends=('alsa-lib' 'desktop-file-utils' 'dbus-glib' 'gtk2' 'hunspell' 'mozilla-common'
         'nss' 'libevent' 'libvpx' 'libxt' 'python2' 'startup-notification')
source=("http://bluegriffon.org/freshmeat/$pkgver/bluegriffon-$pkgver.Ubuntu16.04-x86_64.tar.bz2" "bluegriffon.desktop")
sha256sums=('SKIP' 'SKIP')

package() {
  cd "$srcdir"
  mkdir -p ${pkgdir}/opt/
  bsdtar xf bluegriffon-$pkgver.Ubuntu16.04-x86_64.tar.bz2 -C "$pkgdir/opt"
  install -Dm644 "bluegriffon.desktop" "$pkgdir/opt/bluegriffon"
}
