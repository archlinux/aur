# Maintainer: Daniel Rudolf <flatalias at daniel-rudolf dot de>

pkgname=flatalias
pkgver=1.0.1
pkgrel=1
pkgdesc="Turn Flatpak application IDs into simple shell commands with Flatalias."
url='https://github.com/PhrozenByte/flatalias'
license=('GPL-3.0-only')
arch=('any')
depends=('bash' 'coreutils' 'awk' 'fzf' 'flatpak')
makedepends=('findutils' 'sed')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5554e8942132a20796d5736b7d03349f99af4b0d087efa3610e7cbe1f9146a14')

package() {
    cd $pkgname-$pkgver

    make DESTDIR="$pkgdir" prefix=/usr install
}
