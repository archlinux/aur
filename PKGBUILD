pkgname=ut2004-gog
pkgver=1
pkgrel=1
pkgdesc="Popular first person shooter, native Linux version. (GOG version)"
arch=('x86_64')
url="https://github.com/tim241/ut2004-gog"

depends=('bash' 'awk' 'sed' 'curl' 'wine' 'winetricks')

source=("git+https://github.com/tim241/${pkgname}.git")

sha256sums=('SKIP')

pkgver() {
    git describe --always
}

package() {
    cd "$pkgname"
    install -D ut2004-gog "$pkgdir"/usr/bin/ut2004-gog
    install -D ut2004-linux.tar.bz2 "$pkgdir"/opt/ut2004-gog/ut2004-linux.tar.bz2
}
