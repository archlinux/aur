pkgname=tribler-bin
_pkgname=tribler-bin
pkgver=8.0.7
pkgrel=1
pkgdesc="P2P/Bittorrent/YouTube client"
arch=("x86_64")
url="http://tribler.org"
license=("GPL3")
provides=("tribler")
conflicts=("tribler")
depends=(
libtorrent
python-bitarray
python-configobj
python-lz4
python-pillow
python-pystray)

source=(https://github.com/Tribler/tribler/releases/download/v$pkgver/Tribler_$pkgver\_x64.deb)

sha256sums=('7f054c1f98a687ed358c1950d1c60e1f282d2a24c3c962da75cac8293b0e1a93')

options=(!strip)

package() {
    cd "${pkgdir}"
    tar -xf "${srcdir}/data.tar.xz"
}
