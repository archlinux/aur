# Maintainer: V. claw <vinzzer@protonmail.com>
pkgname=pwndb
pkgver=1
pkgrel=1
pkgdesc='pwndb CLI'
url="https://github.com/mmpx12/pwndb"
arch=('any')
license=('MIT')
depends=('pup' 'curl' 'tor')
source=("${pkgname}-${pkgver}::git+${url}.git")
sha1sums=('SKIP')

package() {
    cd "$pkgname-$pkgver"
    sudo install -m755 pwndb.sh /usr/bin/pwndb
}

