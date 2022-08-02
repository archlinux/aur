# Maintainer: Oshgnacknak <osh@oshgnacknak.de>
pkgname=jagr-bin
pkgver=0.5.0
pkgrel=2
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
sha256sums=('baf0fbc61e2811d580b458c86202836cf33924663658f1e22ef75f8b47cc06ca'
            '8a634d29aa2df6c70b336a4bbfff455a1115708415eb146c96cc4636e90279b2')
noextract=("Jagr-$pkgver.jar")

package() {
    cd "$srcdir"

    mkdir -p $pkgdir/usr/share/jagr/
    cp -v Jagr-$pkgver.jar $pkgdir/usr/share/jagr/Jagr.jar

    mkdir -p $pkgdir/usr/bin
    cp -v jagr $pkgdir/usr/bin
}
