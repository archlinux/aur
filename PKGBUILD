# Contributor: derfenix <derfenix@gmail.com>

pkgname=bpytop
pkgver=1.0.4
pkgrel=1
pkgdesc="Resource monitor that shows usage and stats for processor, memory, disks, network and processes"
arch=('x86_64')
url="https://github.com/aristocratos/bpytop"
license=('Apache')
depends=('python3' 'python-psutil')
source=("https://github.com/aristocratos/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('af2e1fb81f00abb9d0ec8d2ae27a1597df78226d0fa14d254efeb7acc766b85e')


package() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   make DESTDIR="${pkgdir}" PREFIX=/usr install
}
