# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=mounter_elite
pkgver=1.0
pkgrel=1
pkgdesc='A minimal dependency bash based, ISO mounter and converter'
arch=('x86_64')
url="https://github.com/siyia2/mounter_elite"
license=('GPL3')
depends=('bash')
optdepends=('ccd2iso' 'sudo')

# Source should be a valid URL to the source code or a downloadable archive
source=("https://github.com/siyia2/mounter_elite/archive/v${pkgver}.tar.gz")


package() {
  cd "${srcdir}/${pkgname}-$pkgver"
  
  install -Dm755 mounter_elite "$pkgdir/usr/bin/mounter_elite"
  
}


md5sums=('5b47c26fc97bc83f4de20c475e08466a')
