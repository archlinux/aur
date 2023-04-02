# Maintainer: René Wagner < rwagner at rw-net dot de >

pkgname=phosta
pkgver=1.1
pkgrel=1
pkgdesc='photo stats for your terminal'
arch=('x86_64' 'i686' 'aarch64')
depends=('perl-image-exiftool' 'sqlite3' 'perl-text-simpletable-autowidth' 'perl-file-homedir' 'perl-dbd-sqlite')
license=('BSD')
url='https://sr.ht/~rwa/photo-apps'
provides=('photo-stats') 
options=(!strip)
source=("git+https://git.sr.ht/~rwa/photo-stats#tag=${pkgver}") 
sha256sums=('SKIP')

package() {
  cd "${srcdir}/photo-stats"
  mkdir -p "${pkgdir}/usr/bin"
  install -Dm755 phosta "${pkgdir}/usr/bin/"
}
