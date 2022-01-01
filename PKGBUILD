# Maintainer: DevHyperCoder <arduinoleo88 at gmail dot com>

_pkgname=rbmenu
pkgname=$_pkgname-bin
pkgver=0.6.1
pkgrel=2
pkgdesc="Rust Bookmark (d)Menu ; Pre compiled binary"
arch=('x86_64')
url="https://github.com/DevHyperCoder/rbmenu"
license=('GPL')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.zip")
noextract=()
md5sums=('SKIP')

package() {
	cd "$srcdir/"
    mv "$_pkgname-v$pkgver" $_pkgname
    install -Dm755 "$_pkgname" \
        -t "$pkgdir/usr/bin/"
    install -Dm644 "${_pkgname}.1" \
        "$pkgdir/usr/share/man/man1/${_pkgname}.1"

}
