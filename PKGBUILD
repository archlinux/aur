# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributer: Daurnimator <daurnimator@archlinux.org>
# Contributer: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributer: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.0.4
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
source_x86_64=("https://bin.equinox.io/a/fydLsfbG16K/ngrok-v3-3.0.4-linux-amd64")
source_i686=("https://bin.equinox.io/a/fZXabEBxqTt/ngrok-v3-3.0.4-linux-386")
source_armv7h=("https://bin.equinox.io/a/8Fzm6mvbW6H/ngrok-v3-3.0.4-linux-arm")
source_aarch64=("https://bin.equinox.io/a/NGErr1qsBJ/ngrok-v3-3.0.4-linux-arm64")
sha256sums_i686=('94c106392171a537d45ff5db749ce064d721b7c2204c7c951b9e9bfd96fd41f5')
sha256sums_x86_64=('1d93dfcbcf8f1be3a21460022b5644228f9dcc2e71012bd61fcfb39ddf2a7a89')
sha256sums_armv7h=('d9bf182808f254bea7f177f7dc814dbfa0f3a5ee2aea18cfabac7975a9c6397e')
sha256sums_aarch64=('26174fa2a0c22cf44fff118658348d6e4bfa8d60e4cfc092dedc4a0223427916')

package() {
  cd "${srcdir}"

  # Install the program.
  install -Dm755 ngrok-v3-${pkgver}-linux-* "${pkgdir}/usr/bin/ngrok"
}

# vim: ft=sh ts=2 sw=2 et
