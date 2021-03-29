# Maintainer: pjbass <pj@pjbdc.xyz>
pkgname=discli
pkgver=1
pkgrel=1
pkgdesc='Discord TUI client written in Go'
arch=('x86_64')
url="https://github.com/Kaneki07/DisCli"
license=('MIT')
provides=('discli')
conflicts=('cordless-bin')
replaces=('cordless-bin')
source=("$pkgname-$pkgver::https://github.com/Kaneki07/DisCli/releases/download/Discli-1.0/DisCliNux")
noextract=("$pkgname-$pkgver")
md5sums=('SKIP')

package() {
	install -Dm755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/discli"

}
