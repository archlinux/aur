# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_name=gsjackctl
pkgname=gnome-shell-extension-$_name
pkgver=1
pkgrel=1
pkgdesc='GNOME Shell JACK Control'
arch=(any)
url='https://github.com/cbix/gsjackctl'
license=(GPL2)
groups=(pro-audio)
depends=('gnome-shell>=3.38' jack2-dbus)
optdepends=('a2jmidid: can be controlled by the extension')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cbix/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d5017d144ef84707530d3ea0260e4a912b68bea9874ea939c9fb5c1e0f8118ec')

package() {
  install -d "$pkgdir"/usr/share/gnome-shell/extensions
  cp -va $_name-$pkgver "$pkgdir"/usr/share/gnome-shell/extensions/$_name@cbix.de
}
