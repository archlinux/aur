# Maintainer: tygrdev <hi@tygr.dev>
# Contributor: tygrdev, wackery
pkgname=pulsar-music-bin
pkgver=0.0.3
pkgrel=1
pkgdesc="A local-first, cross-platform music player."
arch=('x86_64')
url="https://usepulsar.app"
license=('AGPL-3.0-or-later')
provides=('pulsar-music')
conflicts=('pulsar-music')
depends=('alsa-lib' 'fontconfig' 'freetype2' 'libxkbcommon' 'libx11' 'libxcb' 'wayland' 'dbus' 'vulkan-icd-loader')
source=("pulsar-music_${pkgver}_amd64.deb::https://lab.nordstud.io/api/v4/projects/72/packages/generic/pulsar/0.0.3/pulsar-music_0.0.3_amd64.deb")
sha256sums=('SKIP')

package() {
	bsdtar -xf "${srcdir}/pulsar-music_${pkgver}_amd64.deb" -C "${srcdir}"
	bsdtar -xf "${srcdir}"/data.tar.* -C "${pkgdir}"
}
