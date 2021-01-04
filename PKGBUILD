# Maintainer: Joznia <jz.joznia@protonmail.com>
pkgname=jza
pkgver=0.2.0
pkgrel=1
pkgdesc="Simple AUR helper written in Bash"
arch=('x86_64')
url="https://gitlab.com/joznia/jza"
license=('GPL2')
depends=('git' 'wget')
source=("https://gitlab.com/joznia/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('9a8444f32d4cb4448ac619fb44f31250')

package() {
    mkdir -p "${pkgdir}/usr/share/licenses/$pkgname/"

	cd "$pkgname-v$pkgver"

    install -Dm644 "./LICENSE" \
    "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

    install -Dm755 "./$pkgname.bash" \
    "${pkgdir}/usr/bin/$pkgname"
}
