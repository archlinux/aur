# Maintainer: Oshgnacknak <osh@oshgnacknak.de>
pkgname=vegalinux64
pkgver=1
pkgrel=1
epoch=
pkgdesc="Chess tournament administration sorfware"
arch=('x86_64')
url="https://www.vegachess.com"
license=('Custom')
groups=()
depends=('jre8-openjdk')
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
source=("http://www.vegachess.com/download/$pkgname.tar.gz")
noextract=()
sha256sums=('6f9ba9ee0da41b412b2e3be18ae7b02710abe6672d38c5a56ae54ca466d78e5a')



package() {
    cd "$srcdir/$pkgname"
    mkdir -p $pkgdir/usr/share/$pkgname
    cp -rv * $pkgdir/usr/share/$pkgname
    
    ls -la

    mkdir -p $pkgdir/usr/bin/
    ln -s /usr/share/$pkgname/Vega $pkgdir/usr/bin/Vega
    ln -s /usr/share/$pkgname/VegaTeam $pkgdir/usr/bin/VegaTeam
}
