# Maintainer: Siyia <eutychios23@gmail.com>
pkgname=mounter_elite
pkgver=1.0
pkgrel=1
pkgdesc='A minimal dependency bash-based ISO mounter and converter'
arch=('x86_64')
url="https://github.com/siyia2/Aur"
license=('GPL3')
depends=('bash')
optdepends=('ccd2iso')

# Source should be a valid URL to the source code or a downloadable archive
source=("https://github.com/siyia2/Aur/archive/v${pkgver}.tar.gz")


package() {
  cd "Aur-1.0/"
  
  install -Dm755 mounter_elite "$pkgdir/usr/bin/mounter_elite"
  
}


md5sums=('178dd5f9abc75f7b9687b9eea49b4523')
