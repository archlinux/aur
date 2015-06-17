# Maintainer: M0Rf30

pkgname=fbruteforcer
pkgver=1.0
pkgrel=4
pkgdesc="Facebook bruteforcer tools"
arch=(any)
url="https://gunslingerc0de.wordpress.com/"
license=("GPL")
depends=('python2-mechanize')
source=("${pkgname}.py")

package() {
	install -Dm755 ../${pkgname}.py $pkgdir/usr/bin/${pkgname}
}

md5sums=('0e3175a55ce7e2b9801f06bc936cd311')
