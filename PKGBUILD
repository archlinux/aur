# Contributor: derfenix <derfenix@gmail.com>

pkgname=bpytop
pkgver=1.0.6
pkgrel=1
pkgdesc="Resource monitor that shows usage and stats for processor, memory, disks, network and processes"
arch=('x86_64')
url="https://github.com/aristocratos/bpytop"
license=('Apache')
depends=('python3' 'python-psutil')
source=("https://github.com/aristocratos/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('0eb5fd02f46f4ebe4df8a5a5657eb1914b8ab8a23d22b61919afe6c04a6a57eb')


package() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   make DESTDIR="${pkgdir}" PREFIX=/usr install
}
