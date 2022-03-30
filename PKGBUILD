# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=pillager-bin
pkgver=0.8.1
pkgrel=1
pkgdesc='Pillage filesystems for sensitive information with Go'
arch=(x86_64)
url=https://github.com/brittonhayes/pillager
license=(MIT)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_Linux_${arch[0]}.tar.gz")
sha512sums=('5699da3bda3f44c04fc07ae7b098a8a1a53d3880871976fd7f5d79f3119e01c357d42b312ee969364326fa3968c0af01cae2efb0ce9552ae6ae86adbdaa61533')

package() {
	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
}
