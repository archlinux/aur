# Maintainer: egoroff <egoroff@gmail.com>
pkgname=dirstat-go-bin
pkgver=1.3.0
_app=dirstat
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
pkgdesc="Small tool that shows selected folder or drive usage statistic (binary release)"
url="https://github.com/aegoroff/dirstat"
license=('Apache')
source_x86_64=("https://github.com/aegoroff/dirstat/releases/download/v${pkgver}/${_app}_${pkgver}_linux_amd64.tar.gz")
source_armv7h=("https://github.com/aegoroff/dirstat/releases/download/v${pkgver}/${_app}_${pkgver}_linux_armv7.tar.gz")
source_aarch64=("https://github.com/aegoroff/dirstat/releases/download/v${pkgver}/${_app}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('2dfcfeafc2da5efcd62bed40413a5eb14ae51463d9ca029750119a38dfee16ad')
sha256sums_armv7h=('a6ce2bfabf423f9abcb8757808945f65f098eb11dad7d0744ab69b83d3da420c')
sha256sums_aarch64=('a5a90a979128c814f8484e9817202b0a63c16bb259bad9460ede27e94a2d5873')

build() {
	return 0
}

package() {
	conflicts=("dirstat-bin" "dirstat-go")

	install -Dm0755 "${_app}" "$pkgdir/usr/bin/${_app}"
	install -Dm0644 "LICENSE.txt" "$pkgdir/usr/share/licenses/${_app}/LICENSE.txt"
	install -Dm0644 "README.md" "$pkgdir/usr/share/doc/${_app}/README.md"
}
