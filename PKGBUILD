pkgname=tribler-bin
_pkgname=tribler-bin
pkgver=8.2.3
pkgrel=1
pkgdesc="P2P/Bittorrent/YouTube client"
arch=("x86_64")
url="http://tribler.org"
license=("GPL3")
provides=("tribler")
conflicts=("tribler")
depends=(
libtorrent
python-configobj
python-lz4
python-pillow
python-pystray)

source=(https://github.com/Tribler/tribler/releases/download/v$pkgver/Tribler_$pkgver\_x64.deb)

sha256sums=('c9ae9436d49425138fd83d02ece4e642b7df6d8d42b5f16367de8a0e37fa147f')

options=(!strip)

package() {
    cd "${pkgdir}"
    tar -xf "${srcdir}/data.tar.zst"
}
