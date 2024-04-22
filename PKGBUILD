# Maintainer: egoroff <egoroff@gmail.com>
pkgname=copyto-go-bin
pkgver=1.3.0
_app=copyto
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
pkgdesc="copyto is a small command line app written in Go that allows you to easily one way sync between folders (binary release)"
url="https://github.com/aegoroff/copyto"
license=('MIT')
source_x86_64=("https://github.com/aegoroff/${_app}/releases/download/v${pkgver}/${_app}_${pkgver}_linux_amd64.tar.gz")
source_armv7h=("https://github.com/aegoroff/${_app}/releases/download/v${pkgver}/${_app}_${pkgver}_linux_armv7.tar.gz")
source_aarch64=("https://github.com/aegoroff/${_app}/releases/download/v${pkgver}/${_app}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('1be1fce42f4e522bbcd938484af310b85795f32a94b8f0d34267cf3b56eb0376')
sha256sums_armv7h=('68ba85e7f1229c2537849ae8146c73959751136c89daf7859cfe7bbf340c3f23')
sha256sums_aarch64=('dd50e562d560509be3f318791da20bd06d0d851b32b247089fe317a66e73eb4d')
build() {
	return 0
}

package() {
	conflicts=("copyto-go")

	install -Dm0755 "${_app}" "$pkgdir/usr/bin/${_app}"
	install -Dm0644 "LICENSE.txt" "$pkgdir/usr/share/licenses/${_app}/LICENSE.txt"
	install -Dm0644 "README.md" "$pkgdir/usr/share/doc/${_app}/README.md"
}
