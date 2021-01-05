# Maintainer: Joznia <jz.joznia@protonmail.com>
pkgname=jza
pkgver=0.2.1
pkgrel=1
pkgdesc="Simple AUR helper written in shell"
arch=('x86_64')
url="https://gitlab.com/joznia/jza"
license=('GPL2')
depends=('git' 'wget')
source=("https://gitlab.com/joznia/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('31ec221412119406337dad661cfdfa2c')

package() {
    mkdir -p "${pkgdir}/usr/share/licenses/$pkgname/"

	cd "$pkgname-v$pkgver"

    install -Dm644 "./LICENSE" \
    "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

    install -Dm755 "./$pkgname.sh" \
    "${pkgdir}/usr/bin/$pkgname"
}
