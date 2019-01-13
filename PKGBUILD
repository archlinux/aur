# Maintainer: neodarz <neodarz@neodarz.net>

pkgname=grv
pkgver=0.3.1
pkgrel=1
pkgdesc="terminal interface for viewing git repositories"
arch=('i686' 'x86_64')
url="https://github.com/rgburke/$pkgname"
license=('GPL-3.0')
depends=(ncurses readline curl go)
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/rgburke/grv/releases/download/v$pkgver/${pkgname}_v${pkgver}_linux64")
noextract=()
sha512sums=('f7ddde2aafb4a831d34c398f76283d1c6496c5264c0fc12c1073daf1d75fb724248d18469f2a734046a4a67ae9331bc5f4b92b4a94d144ab185dcd9855e33121')

package() {
    install -Dm755 "$srcdir/${pkgname}_v${pkgver}_linux64" "$pkgdir/usr/bin/$pkgname"
}

