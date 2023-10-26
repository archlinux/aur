# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=mounter_elite
pkgver=1.0.1
pkgrel=1
pkgdesc='A minimal dependency bash based, ISO mounter and converter'
arch=('x86_64')
url="https://github.com/siyia2/mounter_elite"
license=('GPL3')
depends=('bash' 'ccd2iso' 'sudo')

# Source should be a valid URL to the source code or a downloadable archive
source=("https://github.com/siyia2/mounter_elite/archive/v${pkgver}.tar.gz")


package() {
  cd "${srcdir}/${pkgname}-$pkgver"
  
  install -Dm755 mounter_elite "$pkgdir/usr/bin/mounter_elite"
  
}


md5sums=('7dff495039db0a36e5fc139143c18c6d')
