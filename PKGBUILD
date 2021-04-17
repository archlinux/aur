# Maintainer: ComfyDev comfydev@protonmail.com
pkgname="comfetch"
pkgver="0.3"
pkgrel=1
pkgdesc="System information fetching script"
arch=('any')
depends=('bash' 'awk' 'grep')
url=""
license=('unknown')
source=('comfetch')
md5sums=('SKIP')

package(){
	mkdir "$pkgdir/usr"
	mkdir "$pkgdir/usr/bin"
	install -Dm755 "$srcdir/comfetch" "$pkgdir/usr/bin/comfetch"
}
