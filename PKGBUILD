pkgname=tribler-bin
_pkgname=tribler-bin
pkgver=8.1.3
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

sha256sums=('d4c3b19b3183694eca956b9fbe456779981e115dce6a184fc577e9a287833c38')

options=(!strip)

package() {
    cd "${pkgdir}"
    tar -xf "${srcdir}/data.tar.xz"
}
