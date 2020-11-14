# Maintainer: gmes78 <gmes.078 at gmail dot com>

_commit="8810ab6c0daf9f537f2c2bb1ce049fbdae7b9f6e"
pkgname=python-aiohttp-proxy
pkgver=0.1.2
pkgrel=1
pkgdesc="SOCKS proxy connector for aiohttp. HTTP, HTTPS, SOCKS4(a) and SOCKS5(h) proxies are supported."
arch=(any)
url="https://github.com/Skactor/aiohttp-proxy"
license=("Apache")

depends=("python" "python-aiohttp")
makedepends=("python-setuptools")

source=("aiohttp-proxy-${pkgver}::git+https://github.com/Skactor/aiohttp-proxy#commit=${_commit}")
sha512sums=("SKIP")

package() {
    cd "aiohttp-proxy-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
