# Contributor: derfenix <derfenix@gmail.com>

pkgname=bpytop
pkgver=1.0.3
pkgrel=1
pkgdesc="Resource monitor that shows usage and stats for processor, memory, disks, network and processes"
arch=('x86_64')
url="https://github.com/aristocratos/bpytop"
license=('Apache')
depends=('python3' 'python-psutil')
source=("https://github.com/aristocratos/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('f51c6e937031c354b1308311abdcb22158f8e3fcbc8cfef11980c816c61083b7')


package() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   make DESTDIR="${pkgdir}" PREFIX=/usr install
}
