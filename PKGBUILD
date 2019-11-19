# Maintainer: evertonstz

pkgname=pynps-bin
pkgver=0.4
pkgrel=1
pkgdesc="PyNPS is a Nopaystation client writen in python3.7 that, with the help of wget and pkg2zip, can search, download and decrypt/extract PSVita, PSP and PSX games from Nopaystation database. It's basically a command line version of NPSBrowser."
url='https://github.com/evertonstz/pyNPS'
arch=('x86_64')
license=('GPL3')
depends=("wget")
optdepends=("pkg2zip-fork")
source=("https://github.com/evertonstz/pyNPS/releases/download/v${pkgver}/pynps-v${pkgver}-linux-x86_64")
sha256sums=('ab4f7654393c8ce5e0ceae93ccf130d004be3d18797cfd39899c9a9d7dcf96f4')

package() {
  install -Dm755 "pynps-v${pkgver}-linux-x86_64" "${pkgdir}"/usr/bin/pynps
}
