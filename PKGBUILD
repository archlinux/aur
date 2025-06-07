# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=faff
pkgver=0.1.0
pkgrel=1
pkgdesc='ollama powered conventional commit message generator'
arch=(any)
url="https://github.com/wimpysworld/$pkgname"
license=(MIT)
depends=(bash
         bc
         coreutils
         curl
         jq
         git
         ollama)
source=("git+$url.git#tag=$pkgver")
sha256sums=('f99c59bc26d4155e396eb37df1cb4fa5b9f1905b4d7396e5e3567ea5575af7d5')

package () {
	cd "$pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname.sh"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
