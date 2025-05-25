# Maintainer : DXC-0 <thecyberarcher@protonmail.ch>
# Contributor : tadly <me@tadly.de>

pkgname=parsec-bin
pkgver=150_97c
pkgrel=1
pkgdesc='Remotely connect to a gaming pc for a low latency remote computing experience'
url='http://parsec.app'
license=('custom')
arch=('x86_64')
provides=('parsec')
depends=('gcc-libs' 'libglvnd' 'libxext' 'libxcb' 'ffmpeg4.4' 'openssl-1.1' 'libxi' 'pipewire-alsa')
optdepends=('libva: For hardware accelerated decoding')

source=("$pkgname-$pkgver.deb::https://builds.parsec.app/package/parsec-linux.deb")
sha256sums=("f1691ba3a97534604f5f640c26cceafaef672ccf7ab6eed66114d0abafc2cccf")
options=('!strip')

package() {
    tar xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    chmod 755 "${pkgdir}/usr/"
}
