# Contributor: derfenix <derfenix@gmail.com>

pkgname=bpytop
pkgver=1.0.2
pkgrel=2
pkgdesc="Resource monitor that shows usage and stats for processor, memory, disks, network and processes"
arch=('x86_64')
url="https://github.com/aristocratos/bpytop"
license=('Apache')
depends=('python3' 'python-psutil')
source=("https://github.com/aristocratos/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e165aaad7357d7b0b3d5703a60181a49ea7d62dee21f43d765a48dc2075c1b84')


package() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   make DESTDIR="${pkgdir}" PREFIX=/usr install
}
