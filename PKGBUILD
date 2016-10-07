# Maintainer: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributer: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=2.1.14
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('Apache')
source=("https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip")
sha256sums=('17ba5dc5f3232042bf2600606f17435fdcb8c4704a9a057db1edb02bac754afc')
arch=('i686' 'x86_64')

package() {
  cd "${srcdir}"

  # Install the program.
  install -Dm755 ngrok  "${pkgdir}/usr/bin/ngrok"
}

# vim: ft=sh ts=2 sw=2 et
