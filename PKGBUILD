# Contributor: derfenix <derfenix@gmail.com>

pkgname=bpytop
pkgver=1.0.17
pkgrel=1
pkgdesc="Resource monitor that shows usage and stats for processor, memory, disks, network and processes"
arch=('any')
url="https://github.com/aristocratos/bpytop"
license=('Apache')
depends=('python3' 'python-psutil')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aristocratos/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('a8e6d54f9c59741944f1f77a8556cafa17f5a0b0d94652a054af249a7c964097')


package() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   make DESTDIR="${pkgdir}" PREFIX=/usr install
}
