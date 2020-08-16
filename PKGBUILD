# Contributor: derfenix <derfenix@gmail.com>

pkgname=bpytop
pkgver=1.0.16
pkgrel=1
pkgdesc="Resource monitor that shows usage and stats for processor, memory, disks, network and processes"
arch=('any')
url="https://github.com/aristocratos/bpytop"
license=('Apache')
depends=('python3' 'python-psutil')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aristocratos/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b9dae32b53a52e93b193592cca246bcab25706f56c8c4bebe91370cd26e7d77c')


package() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   make DESTDIR="${pkgdir}" PREFIX=/usr install
}
