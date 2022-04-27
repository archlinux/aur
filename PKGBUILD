# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributer: Daurnimator <daurnimator@archlinux.org>
# Contributer: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributer: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.0.3
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
source_x86_64=("https://bin.equinox.io/a/iyHKLSf5wrp/ngrok-v3-3.0.3-linux-amd64")
source_i686=("https://bin.equinox.io/a/8SCmnQT4Vy8/ngrok-v3-3.0.3-linux-386")
source_armv7h=("https://bin.equinox.io/a/2dwe4tHAc69/ngrok-v3-3.0.3-linux-arm")
source_aarch64=("https://bin.equinox.io/a/foG8jEvizww/ngrok-v3-3.0.3-linux-arm64")
sha256sums_i686=('eb665cb63e17ace071f1b5a69543891b486c4ea65683c1fc6c298286f9e68315')
sha256sums_x86_64=('b7c69d54fc537f3a8225647ad8fdf6455b021e09f9bb31d1c943bdd0c8672844')
sha256sums_armv7h=('902a001bc6700b08180ae6bf64058c5d9e6312c0649b001958bb6aeabb64d9ee')
sha256sums_aarch64=('c793fb3013514b024891e42804094dd67c8699973f515eafc801f4ec4f7ec5c2')

package() {
  cd "${srcdir}"

  # Install the program.
  install -Dm755 ngrok-v3-${pkgver}-linux-* "${pkgdir}/usr/bin/ngrok"
}

# vim: ft=sh ts=2 sw=2 et
