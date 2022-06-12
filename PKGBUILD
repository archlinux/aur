# Maintainer: papojari <papojari-git.ovoid@aleeas.com>

pkgname='seehecht'
pkgver=3.0.3
pkgrel=1
pkgdesc='A tool to quickly open a markdown document with already filled out frontmatter'
arch=('x86_64' 'i686' 'pentium4' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://codeberg.org/papojari/$pkgname"
license=('LGPL3')
makedepends=('just' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/papojari/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('afc8e228953fa145b1c65594dbd12a76a63ce15dfb01f93b6446fe9600f84461')

package() {
  cd "$pkgname"
  export SEEHECHT_INSTALL_PATH="$pkgdir/usr"
  just custom-install
}
