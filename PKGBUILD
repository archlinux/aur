# Maintainer: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributer: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=2.2.8
pkgrel=2
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('Apache')
source_i686=("https://bin.equinox.io/a/bAxP1reZDmJ/ngrok-2.2.8-linux-386.tar.gz")
source_x86_64=("https://bin.equinox.io/a/iVLSfdAz1X4/ngrok-2.2.8-linux-amd64.tar.gz")
source_armv7h=("https://bin.equinox.io/a/fU5tPqYmVJv/ngrok-2.2.8-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/kcaGNVrtHM1/ngrok-2.2.8-linux-arm64.tar.gz")
sha256sums_i686=('af078235c5059f2c546d4f17660ac4c0744d0eccd16d5a071ea1eedc15adbe68')
sha256sums_x86_64=('4df55e2e4d57c50f2e3ea17306e0adf8c554a49882f1196194f977e31f8fc9d6')
sha256sums_armv7h=('4213aed313979ea2ca96246bb1038a1d7d6c8b596a5d7f954dbc5ca13adbfcc0')
sha256sums_aarch64=('744e609bb14c65734fa5bd5501d897ffe1a83f8c615aaafd37bf152d24797249')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')

package() {
  cd "${srcdir}"

  # Install the program.
  install -Dm755 ngrok  "${pkgdir}/usr/bin/ngrok"
}

# vim: ft=sh ts=2 sw=2 et
