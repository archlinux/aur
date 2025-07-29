pkgname=tribler-bin
_pkgname=tribler-bin
pkgver=8.2.1
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

sha256sums=('5f1cbfef89acf310337f5d4c94034ec76ec3b598522f9a5eaaebb6b95cc661eb')

options=(!strip)

package() {
    cd "${pkgdir}"
    tar -xf "${srcdir}/data.tar.zst"
}
