pkgname=redondo
pkgver=1.0
pkgrel=1
pkgdesc="Programa que muestra una frase aleatoria de Los Redondos"
arch=('any')
url="https://github.com/arokzZz/redondo.git"
license=('GPL')
source=()
depends=()
build() {
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/redondo"
    cp redondo "$pkgdir/usr/bin/"
    chmod +x "$pkgdir/usr/bin/redondo"
    cp frases.pr "$pkgdir/usr/share/redondo/"
}
