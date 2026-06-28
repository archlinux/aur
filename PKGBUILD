pkgname=tribler-bin
_pkgname=tribler-bin
pkgver=8.4.3
pkgrel=1
pkgdesc="P2P/Bittorrent/YouTube client"
arch=("x86_64")
url="http://tribler.org"
license=("GPL3")
provides=("tribler")
conflicts=("tribler")
depends=(
libtorrent
python-lz4
python-pillow
python-pystray)

source=(https://github.com/Tribler/tribler/releases/download/v$pkgver/Tribler_$pkgver\_x64.deb)

sha256sums=('260c612286e0c0747d5a83df89cf47a078839d665d14a3e379c810fcfd75c186')

options=(!strip)

package() {
    cd "${pkgdir}"
    tar -xf "${srcdir}/data.tar.zst"
}
