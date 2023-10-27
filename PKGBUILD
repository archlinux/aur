# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=elite-image-mounter
pkgver=1.3.0
pkgrel=1
pkgdesc='A minimalist bash based, ISO mounter and converter'
arch=('x86_64')
url="https://github.com/siyia2/mounter_elite"
license=('GPL3')
depends=('bash' 'ccd2iso' 'sed' 'sudo')
md5sums=('8350aecd5a2f2d50aab82f4f5a3f3849')

source=("https://github.com/siyia2/mounter_elite/archive/v${pkgver}.tar.gz")


package() {
  
  cd "${srcdir}/mounter_elite-$pkgver"
  
  install -Dm755 elite-image-mounter "$pkgdir/usr/bin/mounter_elite"
  
}



