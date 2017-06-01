# Maintainer: Germán Osella Massa <gosella@gmail.com>
# Based on a previous PKGBUILD available on AURv3.
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Tianjiao Yin <ytj000@gmail.com>
# Contributor: Vinicius de Avila Jorge <vinicius.avila.jorge@gmail.com>
pkgname=cppreference
pkgver=20170409
pkgrel=1
pkgdesc="A complete reference for the features in the C++ Standard Library. HTML book."
arch=('any')
url="http://en.cppreference.com/"
license=('CCPL:cc-by-sa')
options=('!strip' '!emptydirs')
depends=('ttf-dejavu')
source=("http://upload.cppreference.com/mwiki/images/3/37/html_book_20170409.tar.gz")
sha256sums=('136bbf532cca6c266bcc5800af90a271667e9aaa6cc27d4d60be71fffc216362')

package() {
    rm "$srcdir/reference/common/DejaVuSansMonoCondensed60.ttf"
    rm "$srcdir/reference/common/DejaVuSansMonoCondensed75.ttf"
    mkdir -p "$pkgdir/usr/share/doc/cppreference"
    mv -t "$pkgdir/usr/share/doc/cppreference/" $srcdir/reference/*
}
