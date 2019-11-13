# Maintainer: evertonstz

pkgname=pynps-bin
pkgver=0.2
pkgrel=1
pkgdesc="PyNPS is a Nopaystation client writen in python3.7 that, with the help of wget and pkg2zip, can search, download and decrypt/extract PSVita, PSP and PSX games from Nopaystation database. It's basically a command line version of NPSBrowser."
url='https://github.com/evertonstz/pyNPS'
arch=('x86_64')
license=('GPL3')
depends=("wget")
optdepends=("pkg2zip-fork")
source=("https://github.com/evertonstz/pyNPS/releases/download/v${pkgver}/pynps-v${pkgver}-linux-x86_64")
sha256sums=('59de15055f6a155eae4ac5fadeda4af552e25bb3196aa38894b1b9bfa8e6cfb0')

package() {
  install -Dm755 "pynps-v${pkgver}-linux-x86_64" "${pkgdir}"/usr/bin/pynps
}
