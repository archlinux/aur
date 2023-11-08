# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=mounter-elite-plus
pkgver=2.0.9
pkgrel=3
pkgdesc='A blazing fast and secure, ISO Mounter/Converter for the terminal, written in C++.'
arch=('x86_64')
url="https://github.com/siyia2/mounter-elite-plus"
license=('GPL3')
depends=('bash' 'coreutils' 'readline' 'sudo')
optdepends=('ccd2iso: BIN/IMG conversion support' 'mdf2iso: MDS/MDF conversion support')
md5sums=('2ac21e8900ab98618f0a914e1ed5bb2f')

source=("https://github.com/siyia2/mounter-elite-plus/archive/v${pkgver}.tar.gz")


package() {
  
  cd "${srcdir}/$pkgname-${pkgver}"
  
  install -Dm755 mounter_elite_plus "$pkgdir/usr/bin/mounter_elite_plus"
  
}



