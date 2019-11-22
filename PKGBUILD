# Maintainer: gmes78 <gmes.078 at gmail dot com>

pkgname=python-aiohttp-proxy
pkgver=0.1.1
pkgrel=1
pkgdesc="SOCKS proxy connector for aiohttp. HTTP, HTTPS, SOCKS4(a) and SOCKS5(h) proxies are supported."
arch=(any)
url="https://github.com/Skactor/aiohttp-proxy"
license=("Apache")

depends=("python" "python-aiohttp")
makedepends=("python-setuptools")

source=("https://github.com/Skactor/aiohttp-proxy/archive/v${pkgver}.tar.gz")
sha512sums=("c7eb751716f06ba7c9275b7f52abeedec68ad3dd8ac92f7e2c9f4c855d038d2654b39ef69482b4d96fc8066dda13dda742b32128f3744b5f993efd2ae7a1b486")

package() {
    cd "aiohttp-proxy-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
