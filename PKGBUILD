# Maintainer: Germán Osella Massa <gosella@gmail.com>
# Based on a previous PKGBUILD available on AURv3.
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Tianjiao Yin <ytj000@gmail.com>
# Contributor: Vinicius de Avila Jorge <vinicius.avila.jorge@gmail.com>
pkgname=cppreference
pkgver=20170214
pkgrel=1
pkgdesc="A complete reference for the features in the C++ Standard Library. HTML book."
arch=('any')
url="http://en.cppreference.com/"
license=('CCPL:cc-by-sa')
options=('!strip' '!emptydirs')
depends=('ttf-dejavu')
source=("http://upload.cppreference.com/mwiki/images/f/f2/html_book_20170214.tar.gz")
sha256sums=('4c1b907a4029d83eea62211ae0f1335a313789929b0f97cd438bbf977075978a')

package() {
    rm "$srcdir/reference/common/DejaVuSansMonoCondensed60.ttf"
    rm "$srcdir/reference/common/DejaVuSansMonoCondensed75.ttf"
    mkdir -p "$pkgdir/usr/share/doc/cppreference"
    mv -t "$pkgdir/usr/share/doc/cppreference/" $srcdir/reference/*
}
