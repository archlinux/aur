# Maintainer: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributer: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=2.2.8
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('Apache')
source_x86_64=("https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip")
sha256sums_i686=('120f3fc20ba376042d1eed56545de75e86435fece02c1a76bcbc40efccbe9ca7')
sha256sums_x86_64=('ff5926b1c141dbe9a005b642a10d819fc498a069d69588767a18349c521839dd')
sha256sums_armv7h=('2cef6b188b335649ac26cd3166c3522d8c8d033cfca5f5bfde7ed4b9e069fd11')
source_i686=("https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip")
source_armv7h=("https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip")
arch=('i686' 'x86_64' 'armv7h')

package() {
  cd "${srcdir}"

  # Install the program.
  install -Dm755 ngrok  "${pkgdir}/usr/bin/ngrok"
}

# vim: ft=sh ts=2 sw=2 et
