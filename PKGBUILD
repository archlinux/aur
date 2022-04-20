# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributer: Daurnimator <daurnimator@archlinux.org>
# Contributer: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributer: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
source_i686=("https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-386.tgz")
sha256sums_i686=('d2dd8a2f3b79c26138bc5509d5e861165f213445685f42a0fa4feb7b66753cec')
sha256sums_x86_64=('d1a633968fb51a19df5812923e650c4ddc8870aa5cb306d15c3f91f7868351af')
sha256sums_armv7h=('1829a5c93a500c664390edd2f9a10f6fe4dabfd57f5d6ab09f8969de6919678d')
sha256sums_aarch64=('d2ec73f3f5df84c30c6d716297d71874f3f34e2434e7e39633c52e6bc1289f9a')
source_x86_64=("https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz")
source_armv7h=("https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-arm.tgz")
source_aarch64=("https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-arm64.tgz")

package() {
  cd "${srcdir}"

  # Install the program.
  install -Dm755 ngrok "${pkgdir}/usr/bin/ngrok"
}

# vim: ft=sh ts=2 sw=2 et
