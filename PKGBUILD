# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=elite-image-mounter
pkgver=1.5.0
pkgrel=2
pkgdesc='A minimalist bash based, ISO mounter and converter.'
arch=('x86_64')
url="https://github.com/siyia2/mounter_elite"
license=('GPL3')
depends=('bash' 'ccd2iso' 'coreutils' 'sudo')
md5sums=('a8790e27b1481cd610935971afd19c54')

source=("https://github.com/siyia2/mounter_elite/archive/v${pkgver}.tar.gz")


package() {
  
  cd "${srcdir}/mounter_elite-$pkgver"
  
  install -Dm755 elite-image-mounter "$pkgdir/usr/bin/mounter_elite"
  
}



