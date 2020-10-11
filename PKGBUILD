# Maintainer: v. claw <vinzzer@protonmail.com>
pkgname=tsld_brute
pkgver=2020.10.11
pkgrel=1
pkgdesc='top level domain & second level domain brute forcer'
url="https://github.com/mmpx12/tsld_brute"
arch=('any')
license=('MIT')
depends=('iputils' 'whois' 'nmap' 'bash')
source=("${pkgname}-${pkgver}::git+${url}.git")
sha1sums=('SKIP')

package() {
    cd "$pkgname-$pkgver"
    sudo make
}

