# Contributor: derfenix <derfenix@gmail.com>

pkgname=bpytop
pkgver=1.0.15
pkgrel=1
pkgdesc="Resource monitor that shows usage and stats for processor, memory, disks, network and processes"
arch=('any')
url="https://github.com/aristocratos/bpytop"
license=('Apache')
depends=('python3' 'python-psutil')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aristocratos/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('14eead784e8b1a0d6ad85703722004b4d6cf5ac2e5e3679e0f23267bfe112e47')


package() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   make DESTDIR="${pkgdir}" PREFIX=/usr install
}
