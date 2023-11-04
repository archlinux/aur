# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=mounter-elite-plus
pkgver=2.0.1
pkgrel=2
pkgdesc='A minimalist and secure, ISO Mounter/Converter, written in C++.'
arch=('x86_64')
url="https://github.com/siyia2/mounter-elite-plus"
license=('GPL3')
depends=('bash' 'coreutils' 'readline' 'sudo')
optdepends=('ccd2iso: BIN/IMG conversion support' 'mdf2iso: MDS/MDF conversion support')
md5sums=('3d0dfb70ad48d4606583d98f81d36ce0')

source=("https://github.com/siyia2/mounter-elite-plus/archive/v${pkgver}.tar.gz")


package() {
  
  cd "${srcdir}/$pkgname-${pkgver}"
  
  install -Dm755 mounter_elite_plus "$pkgdir/usr/bin/mounter_elite_plus"
  
}



