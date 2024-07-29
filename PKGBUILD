# Maintainer: Ahmet Arda Kavakcı <ahmetardakavakci@gmail.com>

pkgname=websum-bin
_reponame=websum
pkgver=v0.3.0
pkgrel=1
pkgdesc="Next-gen integrity checker written in Rust"
provides=('websum')
arch=(x86_64)
url="https://github.com/yilmaz08/websum"
license=('MIT')
conflicts=('websum-git')
source=("$_reponame-$pkgver::https://github.com/yilmaz08/$_reponame/releases/download/$pkgver/$_reponame-$pkgver")
sha256sums=('3a8f17879ff82b7f2662310a6bc168ea41ed559c1e40b10e423d94c5c4ea7abf')

package() {
	install -Dm755 $srcdir/$_reponame-$pkgver "${pkgdir}/usr/bin/${_reponame}"
}
