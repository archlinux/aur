# Maintainer: egoroff <egoroff@gmail.com>
pkgname=copyto-go-bin
pkgver=1.3.1
_app=copyto
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
pkgdesc="copyto is a small command line app written in Go that allows you to easily one way sync between folders (binary release)"
url="https://github.com/aegoroff/copyto"
license=('MIT')
source_x86_64=("https://github.com/aegoroff/${_app}/releases/download/v${pkgver}/${_app}_${pkgver}_linux_amd64.tar.gz")
source_armv7h=("https://github.com/aegoroff/${_app}/releases/download/v${pkgver}/${_app}_${pkgver}_linux_armv7.tar.gz")
source_aarch64=("https://github.com/aegoroff/${_app}/releases/download/v${pkgver}/${_app}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('0d1ef7c18ffc66e18cd5689920b4e3e78a68a7418c5d19de248cac30eedcb552')
sha256sums_armv7h=('e0072d7eb9d0da3973b01d4f95883cf4d841ed50c2d508dbdd828e990c93c058')
sha256sums_aarch64=('179765ddf527f942595e180a6c36224efd76ea00540ea715f3615dccbd11103c')
build() {
	return 0
}

package() {
	conflicts=("copyto-go")

	install -Dm0755 "${_app}" "$pkgdir/usr/bin/${_app}"
	install -Dm0644 "LICENSE.txt" "$pkgdir/usr/share/licenses/${_app}/LICENSE.txt"
	install -Dm0644 "README.md" "$pkgdir/usr/share/doc/${_app}/README.md"
}
