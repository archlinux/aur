# Maintainer: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributer: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=2.1.18
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('Apache')
source_x86_64=("https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip")
sha256sums_x86_64=('0165a266388e80b467d6f97fcc42baa51da262c467b99bfb79305d7b6dd22b94')
source_i686=("https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip")
sha256sums_i686=('97746f160088a8fffd79a3897225b58ba62a1bb72cbbcce1d3542a786622fba6')
source_armv7h=("https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip")
sha256sums_armv7h=('f2bf6e1c4221e7847a0c4fd3728f2140d7af80a8e0ab2072ae6c919d893bb254')
arch=('i686' 'x86_64' 'armv7h')

package() {
  cd "${srcdir}"

  # Install the program.
  install -Dm755 ngrok  "${pkgdir}/usr/bin/ngrok"
}

# vim: ft=sh ts=2 sw=2 et
