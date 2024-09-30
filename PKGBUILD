# Maintainer: Murli Tawari <kraanzu@gmail.com>
# Maintainer: Jax Young <jaxvanyang@gmail.com>

pkgname=dooit
pkgver=2.2.0
pkgrel=3
pkgdesc="A todo manager that you didn't ask for, but needed!"
url='https://github.com/kraanzu/dooit'
arch=('x86_64')
license=('MIT')
depends=('zlib')
conflicts=('dooit-git')
_binary=linux-dooit
source=(
    "$_binary-$pkgver::$url/releases/download/v$pkgver/$_binary"
    "$url/raw/v$pkgver/LICENSE"
)
sha256sums=('2c078bd844d3b4b1b2ca56d894d739baa0aad5fa809246ec25ee932fd2b8e029'
            '33504ada23da37774e0d02d99a3a61328f3df017a2bf8468525cd30bb86f57ec')

package() {
    install -Dm0755 "$_binary-$pkgver" "$pkgdir/usr/bin/dooit"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
