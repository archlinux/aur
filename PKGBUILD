# Maintainer: papojari <papojari-git.ovoid@aleeas.com>

pkgname='seehecht'
pkgver=3.0.2
pkgrel=1
pkgdesc='A tool to quickly open a markdown document with already filled out frontmatter'
arch=('x86_64' 'i686' 'pentium4' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://codeberg.org/papojari/$pkgname"
license=('LGPL3')
makedepends=('just' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/papojari/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('0ff12d079f02e4bb1e489f5650f8cd592b5a0a94b946306c8eb91041a8527b95')

package() {
  cd "$pkgname"
  export SEEHECHT_INSTALL_PATH="$pkgdir/usr"
  just custom-install
}
