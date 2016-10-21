# Maintainer: Claudio d'Angelis <claudiodangelis at gmail dot com>
pkgname=postman
pkgver=4.8.0
pkgrel=1
pkgdesc="Build, test, and document your APIs faster"
arch=('x86_64')
url="https://www.getpostman.com"
license=('MIT')
source=(
	"https://dl.pstmn.io/download/latest/linux?arch=64"
)
md5sums=(
	"a6009fc0360410dab899af6d90cbcd81"
)

package() {
	install -dm755 "${pkgdir}/opt/"
	chmod -R 755 "Postman"
	cp -r "Postman" "${pkgdir}/opt/postman"
	chmod -R 755 "${pkgdir}/opt/postman"
  	install -dm755 "${pkgdir}/usr/bin"
  	ln -s "/opt/postman/Postman" "${pkgdir}/usr/bin/postman"
}
