# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=pillager-bin
pkgver=0.8.0
pkgrel=1
pkgdesc='Pillage filesystems for sensitive information with Go'
arch=(x86_64)
url=https://github.com/brittonhayes/pillager
license=(MIT)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_Linux_${arch[0]}.tar.gz")
sha512sums=('7e7aad78e232d9db0ee094e3ff65d5f4671e006d0a7f76703f095e5e480764b3a8405cd897e9883e971fabe6ffcf826b46a43d21ef29bda32c0767df84f99c97')

package() {
	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
}
