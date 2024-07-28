# Maintainer: Ahmet Arda Kavakcı <ahmetardakavakci@gmail.com>

pkgname=websum-bin
_reponame=websum
pkgver=v0.2.1
pkgrel=1
pkgdesc="Next-gen integrity checker written in Rust"
provides=('websum')
arch=(x86_64)
url="https://github.com/yilmaz08/websum"
license=('MIT')
conflicts=('websum-git')
source=("$_reponame-$pkgver::https://github.com/yilmaz08/$_reponame/releases/download/$pkgver/$_reponame-$pkgver")
sha256sums=('e0770b4f999025fea28906906cfae7cdbbfe70bb5fa8d752f9e909e743e7c8bc')

package() {
	install -Dm755 $srcdir/$_reponame-$pkgver "${pkgdir}/usr/bin/${_reponame}"
}
