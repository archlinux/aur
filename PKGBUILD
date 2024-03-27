# Maintainer: Murli Tawari <kraanzu@gmail.com>
# Maintainer: Jax Young <jaxvanyang@gmail.com>

pkgname=dooit-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="A todo manager that you didn't ask for, but needed!"
url='https://github.com/kraanzu/dooit'
arch=('x86_64')
license=('MIT')
depends=('zlib')
provides=('dooit')
conflicts=('dooit' 'dooit-git')
_binary=linux-dooit
source=(
    "$_binary-$pkgver::$url/releases/download/v$pkgver/$_binary"
    "$url/raw/v$pkgver/LICENSE"
)
sha256sums=('bae540f4da2f73f1dbab5860d05df798b6ab27d5690d84f3405fc1232cee9c60'
            '33504ada23da37774e0d02d99a3a61328f3df017a2bf8468525cd30bb86f57ec')

package() {
    install -Dm0755 "$_binary-$pkgver" "$pkgdir/usr/bin/dooit"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
