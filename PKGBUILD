# Maintainer: Patryk Kurdziel <patryk.kurdziel@protonmail.com>

pkgname=mpris-discord-rpc
pkgver=0.2.0
pkgrel=1
pkgdesc='MPRIS Discord music rich presence status with support for album covers and progress bar.'
url="https://github.com/patryk-ku/$pkgname"
license=('MIT')
arch=('x86_64')
source=(
    "https://github.com/patryk-ku/$pkgname/releases/download/v$pkgver/$pkgname"
    "https://raw.githubusercontent.com/patryk-ku/$pkgname/main/LICENSE"
)
sha512sums=(
    '389dcd0227658ae5e38a20ba4263e934c95f7666382d0cbc6539c3b8ee43c3937506205d8d3267c2c1c4b2528d28be6a0340d80c9c51a0f3e6b30228be4ef1bc'
    'c2b16df74d9a4a258961ae1d9b67bd222bf3133a36e0e8425b83163b9fd8c68e9c5df7f23c41067e80ae2639e0d3d1b0235708cb097f2213a6e80882aebd14d2'
)

package() {
	install -Dm755 "mpris-discord-rpc" -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
