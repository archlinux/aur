# Maintainer: 0xnhsec <://github.com>
pkgname=tld-sweeper
pkgver=1.1
pkgrel=1
pkgdesc="A simple TLD sweeper tool supporting ccTLD, gTLD, sTLD, and custom AA-ZZ brute-force"
arch=('any')
url="https://0xnhsec/github.com/TLD-sweeper"
license=('GPL-3.0-only')
depends=('python' 'python-httpx')

source=("tldsweep.py::https://githubusercontent.com")
sha256sums=('a9a2075f66cb2347a50bb765c62dcaf1e5b1571badda7ecafe524d15c0084759')

package() {
    install -Dm755 "${srcdir}/tldsweep.py" "${pkgdir}/usr/bin/tldsweep"
}
