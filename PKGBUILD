# Contributor: derfenix <derfenix@gmail.com>

pkgname=bpytop
pkgver=1.0.9
pkgrel=1
pkgdesc="Resource monitor that shows usage and stats for processor, memory, disks, network and processes"
arch=('x86_64')
url="https://github.com/aristocratos/bpytop"
license=('Apache')
depends=('python3' 'python-psutil')
source=("https://github.com/aristocratos/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('c9c9a9253828ab42eabe60de59ab43f4c5b3fa5cb6e5082131bcaf5269a2b2bd')


package() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   make DESTDIR="${pkgdir}" PREFIX=/usr install
}
