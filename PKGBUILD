# Maintainer: blacktea <blackteahamburger@outlook.com>
# Contributor: Tomasz Zok
pkgname=classroom-assistant
pkgver=2.0.2
pkgrel=2
pkgdesc="GitHub Classroom Assistant is a cross-platform desktop application to help you get student repositories for grading."
arch=(x86_64)
url="https://github.com/education/classroom-assistant"
license=('MIT')
source=("https://github.com/education/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-1.x86_64.rpm")
md5sums=('b78182dbbf701e30851549533dbd8002')

package() {
    mv $srcdir/usr $pkgdir
}
