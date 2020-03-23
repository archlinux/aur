# Maintainer: Tomasz Zok
pkgname=classroom-assistant
pkgver=1.0.5
pkgrel=1
pkgdesc="GitHub Classroom Assistant is a cross-platform desktop application to help you get student repositories for grading."
arch=(x86_64)
url="https://github.com/education/classroom-assistant"
license=('MIT')
source=("https://github.com/education/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.x86_64.rpm")
md5sums=('e05da8923cc344fcba15c08cc423fa3e')

package() {
    mv $srcdir/usr $pkgdir
}
