# Contributor: derfenix <derfenix@gmail.com>

pkgname=bpytop
pkgver=1.0.10
pkgrel=1
pkgdesc="Resource monitor that shows usage and stats for processor, memory, disks, network and processes"
arch=('x86_64')
url="https://github.com/aristocratos/bpytop"
license=('Apache')
depends=('python3' 'python-psutil')
source=("https://github.com/aristocratos/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('1071a1bd1731aa2022340542a6eb57b541701ea8fc72848edeabafd591fafb7b')


package() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   make DESTDIR="${pkgdir}" PREFIX=/usr install
}
