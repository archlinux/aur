# Maintainer: fenuks

pkgname=thesaurus-pl
pkgver=0.8.67
pkgrel=2
pkgdesc="A plain text thesaurus file for Polish language suitable for using with vim"
arch=("any")
url="https://dobryslownik.pl/"
license=("GPL")
depends=()
optdepends=()
conflicts=("${pkgname}")
# install=$pkgname.install
source=("https://pobierz.dobryslownik.pl/thesaurus.txt-latest.gz")
md5sums=('SKIP')

package() {
    cd "${srcdir}"
    install -Dm644 thesaurus.txt-latest "$pkgdir/usr/share/thes/polish"
}
