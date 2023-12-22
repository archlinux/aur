# Maintainer: jim3692 <jim3692 at gmail.com>
pkgname="pipewire-screenaudio-librewolf"
pkgver=0.1.0
pkgrel=2
pkgdesc="Pipewire Screenaudio Native Messaging for LibreWolf"
arch=('x86_64')
url="https://github.com/IceDBorn/pipewire-screenaudio"
license=('GPL3')
depends=(
  'pipewire-screenaudio'
  )
options=(!lto)
conflicts=()
provides=()
source=()
sha256sums=()

package() {
  mkdir -p "$pkgdir/usr/lib/librewolf/native-messaging-hosts"
  cd "$pkgdir/usr/lib/librewolf/native-messaging-hosts"
  ln -s "/usr/lib/mozilla/native-messaging-hosts/com.icedborn.pipewirescreenaudioconnector.json" "./"
}
