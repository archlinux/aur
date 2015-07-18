# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>

pkgname=jcadencii
pkgver=3.3.9+svn20110818.r1732
pkgrel=1
pkgdesc="Piano roll editor for singing synthesis, supporting VOCALOID, VOCALOID2, UTAU, WORLD, AquesTone synthesis engines"
arch=('any')
url="https://packages.debian.org/sid/main/jcadencii"
license=('GPL3')
depends=('java-environment')
optdepends=('wine')
provides=('cadencii')
source=("http://ftp.debian.org/debian/pool/main/c/cadencii/jcadencii_${pkgver}-4_all.deb")
md5sums=('SKIP')

package() {
    cd "$pkgdir"
    tar xf "$srcdir/data.tar.xz"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    cp "$pkgdir/usr/share/doc/jcadencii/copyright" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
