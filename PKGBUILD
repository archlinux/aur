# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=sshmnt
pkgver=1.6.1
pkgrel=1
pkgdesc='A utility for managing multiple sshfs profiles from the commandline'
url='https://github.com/prurigro/sshmnt'
license=('GPL3')
arch=('any')
depends=('fuse2' 'sshfs' 'openssh' 'bc')
source=("https://github.com/prurigro/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('fb80c29d1176f063690a779fff03bf0d0d8b4b87aee07691353de3b9fae380702eff3d11a492a96d63782e7de87b13ec3a90eb30d4969315b4f5ab900e529477')

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 ${pkgname}.1.gz "$pkgdir"/usr/share/man/man1/${pkgname}.1.gz
}
