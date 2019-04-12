# Maintainer: annguyenfoss <an@linux.vn>
pkgname=archlinuxarm-installer
pkgver=1.0
pkgrel=1
pkgdesc="Universal, automatic installer for ArchLinux ARM"
arch=('any')
url="https://github.com/adjutant/archlinuxarm-installer"
license=('GPL3')
depends=('bash' 'e2fsprogs' 'dosfstools' 'coreutils' 'util-linux' 'libarchive')
makedepends=('git')
source=($pkgname-$pkgver.tar.gz::https://github.com/adjutant/$pkgname/archive/$pkgver.tar.gz) 
sha256sums=('805f9e5dd87f2b7215d076317dbb5b10476ff825ca7e601ff36e98fd5ad3950a')

package() {
  cd "$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin/"
  install -Dm755 src/archlinuxarm-installer "$pkgdir/usr/bin/"
}
