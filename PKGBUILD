# Maintainer: Ahmet Arda Kavakcı <ahmetardakavakci@gmail.com>

pkgname=websum-bin
_reponame=websum
pkgver=v0.4.1
pkgrel=1
pkgdesc="Next-gen integrity checker written in Rust"
provides=('websum')
arch=(x86_64)
url="https://github.com/yilmaz08/websum"
license=('MIT')
conflicts=('websum-git')
source=("$_reponame-$pkgver::https://github.com/yilmaz08/$_reponame/releases/download/$pkgver/$_reponame-$pkgver")
sha256sums=('f8f6171334cabab151a40f79d2400047cc71c9565aebf8995bf0804ae01470d5')

package() {
	install -Dm755 $srcdir/$_reponame-$pkgver "${pkgdir}/usr/bin/${_reponame}"
}
