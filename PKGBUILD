# Maintainer: Oshgnacknak <osh@oshgnacknak.de>
pkgname=jagr-bin
pkgver=0.4.1
pkgrel=0
epoch=
pkgdesc='Java AutoGrader, implemented in Kotlin'
arch=('x86_64')
url='https://github.com/SourceGrade/Jagr'
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
sha256sums=('145293507a15f97bab255b9e08d84113e43425f0b003b36d627acea5278a46f1'
            '8a634d29aa2df6c70b336a4bbfff455a1115708415eb146c96cc4636e90279b2')
noextract=()

package() {
    cd "$srcdir"

    mkdir -p $pkgdir/usr/share/jagr
    cp -v *.jar $pkgdir/usr/share/jagr/Jagr.jar

    mkdir -p $pkgdir/usr/bin
    cp -v jagr $pkgdir/usr/bin
}
