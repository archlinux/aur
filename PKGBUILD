# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributer: Daurnimator <daurnimator@archlinux.org>
# Contributer: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributer: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.0.5
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
source_x86_64=("https://bin.equinox.io/a/jJMARsGUFYx/ngrok-v3-3.0.5-linux-amd64")
source_i686=("https://bin.equinox.io/a/d3dgsQPPHat/ngrok-v3-3.0.5-linux-386")
source_armv7h=("https://bin.equinox.io/a/2N62p5oVVsY/ngrok-v3-3.0.5-linux-arm")
source_aarch64=("https://bin.equinox.io/a/gbQ7TnVNcc4/ngrok-v3-3.0.5-linux-arm64")
sha256sums_i686=('2bee802579d20ade60fb21cbd2c76ac29e36e2dd635c3f4f4e99a7e66b036512')
sha256sums_x86_64=('60ced57abf5cfe1189ae1e7eb46a506b814794a5e4c7a3f5722c8d00c9d2650f')
sha256sums_armv7h=('96c317053690c9bc6e4736277dafae9f57e44c01a7aa16d6689ceafa2bd78d05')
sha256sums_aarch64=('882f9dfbe0941c8b2d3fe786a977e9c738b8f8d2fea406ec04a084d1b4f9bcb0')

package() {
  cd "${srcdir}"

  # Install the program.
  install -Dm755 ngrok-v3-${pkgver}-linux-* "${pkgdir}/usr/bin/ngrok"
}

# vim: ft=sh ts=2 sw=2 et
