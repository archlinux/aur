# Maintainer: papojari <papojari-git.ovoid@aleeas.com>

pkgname='sanctity'
pkgver=1.3.0
pkgrel=1
pkgdesc='Test the 16 terminal colors in all combinations'
arch=('x86_64' 'i686' 'pentium4' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://codeberg.org/papojari/$pkgname"
license=('LGPL3')
makedepends=('just' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/papojari/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('5910a26ce15c874e12bdaefbcabcbb0119bdb868be8b1e105050fa08ab32cb14')

package() {
  cd "$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  export SANCTITY_INSTALL_PATH="$pkgdir/usr"
  just custom-install
}
