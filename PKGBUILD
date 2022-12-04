# Maintainer: Oshgnacknak <osh@oshgnacknak.de>
pkgname=jagr-bin
pkgver=0.7.0
pkgrel=0
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
provides=('jagr')
conflicts=('jagr-git')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/SourceGrade/Jagr/releases/download/v$pkgver/Jagr-$pkgver.jar"
        'jagr')
sha256sums=('523e862b52415405bc584fc819cc55097b605a4c813d1dff2771d3bceb1c6ba2'
            '8a634d29aa2df6c70b336a4bbfff455a1115708415eb146c96cc4636e90279b2')
noextract=("Jagr-$pkgver.jar")

package() {
    cd "$srcdir"

    mkdir -p $pkgdir/usr/share/jagr/
    cp -v Jagr-$pkgver.jar $pkgdir/usr/share/jagr/Jagr.jar

    mkdir -p $pkgdir/usr/bin
    cp -v jagr $pkgdir/usr/bin
}
