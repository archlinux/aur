# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=elite-image-mounter
pkgver=1.5.0
pkgrel=5
pkgdesc='A minimalist bash based, ISO mounter and converter.'
arch=('x86_64')
url="https://github.com/siyia2/mounter_elite"
license=('GPL3')
depends=('bash' 'ccd2iso' 'coreutils' 'sudo')
md5sums=('03452e515fa035a40c15fae39badf070')

source=("https://github.com/siyia2/mounter_elite/archive/v${pkgver}.tar.gz")


package() {
  
  cd "${srcdir}/mounter_elite-$pkgver"
  
  install -Dm755 mounter_elite "$pkgdir/usr/bin/mounter_elite"
  
}



