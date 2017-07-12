# Maintainer: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributer: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=2.1.18
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('Apache')
source_x86_64=("https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip")
sha256sums_i686=('f1e795ec225d808e240ad7d9831454aaf63e7d54525c9fde5743b85fd93fab9b')
sha256sums_x86_64=('a3f667e7b9f3c9e10abb5e277154a0b5e09a011a7f561a2a789fecb34407e108')
sha256sums_armv7h=('4420e1fe2278b1ba32dcf5718bbaacfc410720fd42404d72611a40792abcef5b')
source_i686=("https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip")
source_armv7h=("https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip")
arch=('i686' 'x86_64' 'armv7h')

package() {
  cd "${srcdir}"

  # Install the program.
  install -Dm755 ngrok  "${pkgdir}/usr/bin/ngrok"
}

# vim: ft=sh ts=2 sw=2 et
