# Maintainer: Giacomo Vercesi <mrjackv@hotmail.it>
pkgname=python-iperf3
pkgver=0.1.11
pkgrel=1
pkgdesc="A python library to interface with the ipef3 command-line tool"
arch=('any')
url="https://github.com/thiezn/iperf3-python"
license=('GPL')
makedepends=('python-pip')

package() {
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps iperf3
}
