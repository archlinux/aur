# Maintainer: BlackCatDevel0per <bcdev@mail.ru>
# https://github.com/BlackCatDevel0per

pkgname=scalingo-bin
pkgver=1.26.1
pkgrel=1
pkgdesc="Scalingo cli scalingo.com"
arch=("x86_64" "aarch64")
license=("GPL")
url="https://github.com/BtbN/FFmpeg-Builds"
provides=("scalingo")
conflicts=("scalingo")

source_x86_64=("https://github.com/Scalingo/cli/releases/download/${pkgver}/scalingo_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/Scalingo/cli/releases/download/${pkgver}/scalingo_${pkgver}_linux_arm64.tar.gz")

md5sums_x86_64=('629a1deb8723e36d59d8bad453d21fce')
md5sums_aarch64=('e7a7ccdd3ed154df353a01ff0c799431')

package() {
	cd ${srcdir}/scalingo_${pkgver}_linux_*64

	install -Dm 755 -t "$pkgdir/usr/bin" scalingo
	install -Dm 755 -t "$pkgdir/usr/share/doc/scalingo" LICENSE README.md CHANGELOG.md
}

