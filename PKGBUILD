# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=elite-image-mounter
pkgver=1.5.0
pkgrel=7
pkgdesc='A minimalist bash based, ISO mounter and converter.'
arch=('x86_64')
url="https://github.com/siyia2/mounter_elite"
license=('GPL3')
depends=('bash' 'coreutils' 'sudo')
optdepends=('ccd2iso: BIN/IMG conversion support')
md5sums=('feca9df8e031d179081c2f45d47b8259')

source=("https://github.com/siyia2/mounter_elite/archive/v${pkgver}.tar.gz")


package() {
  
  cd "${srcdir}/mounter_elite-$pkgver"
  
  install -Dm755 mounter_elite "$pkgdir/usr/bin/mounter_elite"
  
}



