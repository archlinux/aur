# Maintainer : Zen Wen <zen.8841@gmail.com>
# Contributor : DXC-0 <thecyberarcher@protonmail.ch>
# Contributor : tadly <me@tadly.de>

pkgname=parsec-bin
pkgver=150_104a
pkgrel=1
pkgdesc='Remotely connect to a gaming pc for a low latency remote computing experience'
url='http://parsec.app'
license=('custom')
arch=('x86_64')
provides=('parsec')
depends=('gcc-libs' 'libglvnd' 'libxext' 'libxcb' 'ffmpeg4.4' 'openssl' 'libxi' 'pipewire-alsa')
optdepends=('libva: For hardware accelerated decoding')

source=("$pkgname-$pkgver.deb::https://builds.parsec.app/package/parsec-linux.deb")
sha256sums=('c8a4407713d72dcb1c59f082977e81e1b9e8ffd679d0666882cde4c8a0821dd2')
options=('!strip')

package() {
    tar xf "${srcdir}/data.tar.zst" -C "${pkgdir}"
    chmod 755 "${pkgdir}/usr/"
}
