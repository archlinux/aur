# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=binders-bin
_srcname=Binders
pkgver=4.371.416
pkgrel=1
pkgdesc="Flexible database creator for organizing arbitrary data"
arch=(any)
url="https://generism.com/"
license=('custom')
depends=('java8-openjfx')
source=("http://generism.com/$_srcname.jar"
        LICENSE
	binders.sh)
noextract=("$_srcname.jar")
sha512sums=('2e7127687f0b9d5eaff4c11523787a84eb1946788b4df89b73a86f799cf4a3deae8c0fe6f1136e06c3e04b19049b9b2e29922dacbd1f6f85d835380211f62d37'
            '608daed787b3f0753b4911d062ab2e89ec396f3d74a3d6b5655a68ea6e96b22e6da71001c126dda85780a7061c413f90482ef55598bd3b0dae02e68a1bab27af'
            '06d5fce19fc6c3cbc872059721d280ae2cd6e8e0baa191666be4dc0e14f3b6a6e120e24772946d91e772708e9e0c185571fb8fec88278204a413d7a312a1ac05')

package() {
	install -Dm644 "$_srcname.jar" "$pkgdir/usr/share/java/$_srcname/$_srcname.jar"
	install -D binders.sh "$pkgdir/usr/bin/binders"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
