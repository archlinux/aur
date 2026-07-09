# Maintainer: 0xnhsec <://github.com>
pkgname=tld-sweeper
pkgver=1.1
pkgrel=1
pkgdesc="A simple TLD sweeper tool supporting ccTLD, gTLD, sTLD, and custom AA-ZZ brute-force"
arch=('any')
url="https://://github.com/TLD-sweeper"
license=('GPL-3.0-only')
depends=('python' 'python-httpx')

source=("tldsweep.py::https://githubusercontent.com")
sha256sums=('ec3f43e420311a61853bf3955483e1a3673b747ea2d56ebabfcda077ff468a82')

package() {
    install -Dm755 "${srcdir}/tldsweep.py" "${pkgdir}/usr/bin/tldsweep"
}
