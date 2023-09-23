# Maintainer: egoroff <egoroff@gmail.com>
pkgname=dirstat-go-bin
pkgver=1.2.4
_app=dirstat
pkgrel=3
arch=('x86_64' 'armv7h' 'aarch64')
pkgdesc="Small tool that shows selected folder or drive usage statistic (binary release)"
url="https://github.com/aegoroff/dirstat"
license=('Apache')
source_x86_64=("https://github.com/aegoroff/dirstat/releases/download/v${pkgver}/${_app}_${pkgver}_linux_amd64.tar.gz")
source_armv7h=("https://github.com/aegoroff/dirstat/releases/download/v${pkgver}/${_app}_${pkgver}_linux_armv7.tar.gz")
source_aarch64=("https://github.com/aegoroff/dirstat/releases/download/v${pkgver}/${_app}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('3da62399d6cb8a8af606bbfda97d1fe0e833b17856793707c5a7e013c43ac6e4')
sha256sums_armv7h=('5e895f4b7b0f9429492b230fc456a7b49646281824c1cc8a5bde3280a98f32d7')
sha256sums_aarch64=('2a7d6a5cef9beeb65f7dc6c94a20ef4d43be871fc84e79efca5d1ab6ccbd90d2')

build() {
	return 0
}

package() {
	conflicts=("dirstat-bin" "dirstat-go")

	install -Dm0755 "${_app}" "$pkgdir/usr/bin/${_app}"
	install -Dm0644 "LICENSE.txt" "$pkgdir/usr/share/licenses/${_app}/LICENSE.txt"
	install -Dm0644 "README.md" "$pkgdir/usr/share/doc/${_app}/README.md"
}
