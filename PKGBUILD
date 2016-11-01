# Maintainer: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributer: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=2.1.18
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('Apache')
source=("https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip")
sha256sums=('0165a266388e80b467d6f97fcc42baa51da262c467b99bfb79305d7b6dd22b94')
arch=('i686' 'x86_64')

package() {
  cd "${srcdir}"

  # Install the program.
  install -Dm755 ngrok  "${pkgdir}/usr/bin/ngrok"
}

# vim: ft=sh ts=2 sw=2 et
