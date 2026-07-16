# Maintainer: Álvaro De Quinta <blackcherry at danwin1210 dot de>

pkgname='sonobus-bin'
pkgdesc='An easy to use application for streaming high-quality, low-latency peer-to-peer audio'
pkgver='1.7.2'
pkgrel='1'
arch=('x86_64')
url='https://sonobus.net'
license=(
  'GPL-3.0-or-later'
)
depends=('alsa-lib' 'freetype2' 'gcc-libs' 'glibc' 'opus')
conflicts=("${pkgname}")
provides=("${pkgname}")
source=("https://raw.githubusercontent.com/sonosaurus/sonobus-packages/refs/heads/gh-pages/freight/apt/stable/main/sonobus_$pkgver-0_ubuntu_amd64.deb")
sha256sums=('a525deec2d7eac4fd8c6d602da81f24ba6ae4dde27ad5b19c2a89990f03c99d9')

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/
}
