# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Emilio Reggi <nag@mailbox.org>

pkgname=bombadillo-bin
pkgver=2.3.3
pkgrel=1
pkgdesc="A non-web client for the terminal, supporting Gopher, Gemini and much more."
arch=('x86_64' 'i686' 'arm')
url="https://bombadillo.colorfield.space"
license=('GPL3')
depends=('glibc')
source_x86_64=("$pkgname-$pkgver-x86_64.zip::$url/binaries/bombadillo-${pkgver}_linux_64.zip")
source_i686=("$pkgname-$pkgver-i686.zip::$url/binaries/bombadillo-${pkgver}_linux_32.zip")
source_arm=("$pkgname-$pkgver-arm.zip::$url/binaries/bombadillo-${pkgver}_linux_arm.zip")
sha256sums_x86_64=('8085294ef719d7cda2946ef3e26e7761470a8bc8a376e273df965d3d677cfc63')
sha256sums_i686=('898deff7136a0bfd1204edeb88ad4ea855a9f7c04335175f22b70ada0fbea5ee')
sha256sums_arm=('a366cb101a5f257d011116eafeefc987bbfbcc3cc7948140a5980d4345a8afa5')

package() {
	install -Dm 755 bombadillo -t "$pkgdir/usr/bin/"
	install -Dm 644 README.txt -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm 644 bombadillo.desktop -t "$pkgdir/usr/share/applications/"
	install -Dm 644 bombadillo-icon.png -t "$pkgdir/usr/share/pixmaps/"
	install -Dm 644 bombadillo.1 -t "$pkgdir/usr/share/man/man1/"
}
