# Maintainer: Oshgnacknak <osh@oshgnacknak.de>
pkgname=jagr-bin
pkgver=0.6.1
pkgrel=1
epoch=
pkgdesc='Java AutoGrader, implemented in Kotlin'
arch=('x86_64')
url='https://github.com/sourcegrade/jagr'
license=('AGPL-3.0')
groups=()
depends=('jre-openjdk')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/SourceGrade/Jagr/releases/download/v$pkgver/Jagr-$pkgver.jar"
        'jagr')
sha256sums=('abebfe73afe30d803ba580b5b011f24273be8d5b4ffa296ddaad67254dbd15f2'
            '8a634d29aa2df6c70b336a4bbfff455a1115708415eb146c96cc4636e90279b2')
noextract=("Jagr-$pkgver.jar")

package() {
    cd "$srcdir"

    mkdir -p $pkgdir/usr/share/jagr/
    cp -v Jagr-$pkgver.jar $pkgdir/usr/share/jagr/Jagr.jar

    mkdir -p $pkgdir/usr/bin
    cp -v jagr $pkgdir/usr/bin
}
