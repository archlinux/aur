# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=cloudabi-pkg-config
pkgver=1.0.2
pkgrel=1
pkgdesc="CloudABI wrapper for pkg-config."
url='https://www.freedesktop.org/wiki/Software/pkg-config/'
license=(GPL)
arch=(any)

depends=(
	'pkg-config'
)

source=(
	'x86_64-unknown-cloudabi-pkg-config'
	'i686-unknown-cloudabi-pkg-config'
	'aarch64-unknown-cloudabi-pkg-config'
	'armv6-unknown-cloudabi-pkg-config'
)

sha512sums=(
	'0a35cc70e4c41ea8ab0a4b4cce109904c695be6af54104d4d55668a8dfcd2b45e0ec99efb5ab061372e15c17db148da8a5fa1e1b5b1ebbcfea45871646509320'
	'3f63c44a5e3f069102562c075af096d77ebb20cd9cd65fc48205dfac9f0d9eafed211976b53579213631367b4bca81823b69e01902bfa7632a6bdfc9bf08256b'
	'0ba89921525f73f0561d36effec72c1eb5c60089dba360b9c07357196504c563b38aea72aabff9db70f9c0bd2c84388b9511d302341b7ff9fa68560f04d019d5'
	'152331399a2e32884695896e35bd8141f60971778f9dc9653f92012d1cf970baae335ab41bc48b88e6278c1a058a36d62217055f3a658989bd3be7b996870058'
)

package() {
	install -d "$pkgdir/usr/bin"
	install -m 755 -t "$pkgdir/usr/bin" "$srcdir/x86_64-unknown-cloudabi-pkg-config"
	install -m 755 -t "$pkgdir/usr/bin" "$srcdir/i686-unknown-cloudabi-pkg-config"
	install -m 755 -t "$pkgdir/usr/bin" "$srcdir/aarch64-unknown-cloudabi-pkg-config"
	install -m 755 -t "$pkgdir/usr/bin" "$srcdir/armv6-unknown-cloudabi-pkg-config"
}
