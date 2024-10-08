pkgname=tribler-bin
_pkgname=tribler-bin
pkgver=7.14.0
pkgrel=2
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
python-service-identity
python-yappi
python-yarl
python-bitarray
libtorrent
python-file-read-backwards
brotli
python-filelock
python-pillow
python-pyqt5
python-pyqt5-sip
python-pyqtgraph
python-pyqt5-webengine
)
source=(https://github.com/Tribler/tribler/releases/download/v$pkgver/tribler_$pkgver\_all.deb)

sha256sums=('2c8d43acdae81fec82c53a5f62efaaccc12d984e14f7b5585ebe3fe31c98bc40')

package() {
    cd "${pkgdir}"
    tar -xf "${srcdir}/data.tar.xz"
}
