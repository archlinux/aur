# Contributor: derfenix <derfenix@gmail.com>

pkgname=bpytop
pkgver=1.0.7
pkgrel=1
pkgdesc="Resource monitor that shows usage and stats for processor, memory, disks, network and processes"
arch=('x86_64')
url="https://github.com/aristocratos/bpytop"
license=('Apache')
depends=('python3' 'python-psutil')
source=("https://github.com/aristocratos/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('f3a820b95c946dc9d21475ffece1e79c92d31f5b122cea024c3db92b31dd71a9')


package() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   make DESTDIR="${pkgdir}" PREFIX=/usr install
}
