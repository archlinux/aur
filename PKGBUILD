# Maintainer: PhrozenByte <flatalias at daniel-rudolf dot de>

pkgname=flatalias
pkgver=1.0.0
pkgrel=1
pkgdesc="Turn Flatpak application IDs into simple shell commands with Flatalias."
url='https://github.com/PhrozenByte/flatalias'
license=('GPL-3.0-only')
arch=('any')
depends=('bash' 'coreutils' 'awk' 'fzf' 'flatpak')
makedepends=('findutils' 'sed')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('144da7a83f944f8b778e89a3bb68a919b279e13d5de5f0fc8c9108ae71cd9b89')

package() {
    cd $pkgname-$pkgver

    make DESTDIR="$pkgdir" prefix=/usr install
}
