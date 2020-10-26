# Maintainer: fenuks

pkgname=thesaurus-pl
pkgver=0.8.67
pkgrel=1
pkgdesc="A plain text thesaurus file for Polish language suitable for using with vim"
arch=("any")
url="https://dobryslownik.pl/"
license=("GPL")
depends=()
optdepends=()
conflicts=("${pkgname}")
# install=$pkgname.install
source=("https://pobierz.dobryslownik.pl/thesaurus.txt-latest.gz")
md5sums=('686c9f4659c45dde17181aab7a7d31d2')
sha256sums=('42bad24d64bc676e4396bfc761fb493ba22781011e7d9841f463f5cbf28769fd')

package() {
    cd "${srcdir}"
    install -Dm644 thesaurus.txt-latest "$pkgdir/usr/share/thes/polish"
}
