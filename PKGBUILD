pkgname=tribler
_pkgname=tribler
pkgver=7.12.0
pkgrel=1
pkgdesc="P2P/Bittorrent/YouTube client"
arch=("x86_64")
url="http://tribler.org"
license=("GPL3")
provides=("tribler")
conflicts=("tribler")
depends=(libtorrent-rasterbar
python-aiohttp
python-aiohttp-apispec
python-anyio
python-chardet
python-configobj
python-cryptography
python-decorator
python-faker
python-libnacl
python-lz4
python-marshmallow
python-netifaces
python-networkx
python-pony
python-psutil
python-pyasn1
python-pydantic
python-pyopenssl
python-yaml
python-sentry_sdk
python-yappi
python-yarl
python-bitarray
libtorrent
python-pillow
python-pyqt5
python-pyqt5-sip
python-pyqtgraph
python-pyqt5-webengine
)
source=(https://github.com/Tribler/tribler/releases/download/v$pkgver/tribler_$pkgver\_all.deb)

sha256sums=('c5675ecc453da4e50e065604b28b5fead108ad3eb91418910c2b2c0f8c18df76')

package() {
    cd "${pkgdir}"
    tar -xf "${srcdir}/data.tar.xz"
}
