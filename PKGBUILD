# Contributor: derfenix <derfenix@gmail.com>

pkgname=bpytop
pkgver=1.0.11
pkgrel=1
pkgdesc="Resource monitor that shows usage and stats for processor, memory, disks, network and processes"
arch=('x86_64')
url="https://github.com/aristocratos/bpytop"
license=('Apache')
depends=('python3' 'python-psutil')
source=("https://github.com/aristocratos/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('86e90c0207eeb44885e061ca716081447b363e4b8c73f967f1b40e55fd5bf37c')


package() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   make DESTDIR="${pkgdir}" PREFIX=/usr install
}
