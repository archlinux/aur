# Maintainer: Roger Díaz Viñolas <rdvdev2@gmail.com>
pkgname=fib-pro1-env
pkgver=2021
pkgrel=1
pkgdesc="The enviroment used in the PRO1 subject of FIB"
arch=('any')
url='www.cs.upc.edu/pro1/data/uploads/entorns-pro1.pdf'
license=('unknown')
depends=('gcc')
optdepends=("kate: the editor recommended by the FIB")
source=("$pkgname-$pkgver::https://gist.githubusercontent.com/rdvdev2/7b83951931b250668536eb310e4f70af/raw/fea59f23c762c984af8da49939cced8ef210ed65/p1++")
sha256sums=('ea7052162eca38428d07a51b26cedab174cbf19b815a3e901cbc8f87424d134c')

package() {
  install -Dp -m755 $pkgname-$pkgver "$pkgdir/usr/bin/p1++"
}
