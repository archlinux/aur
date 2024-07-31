# Maintainer: Ahmet Arda Kavakcı <ahmetardakavakci@gmail.com>

pkgname=websum-bin
_reponame=websum
pkgver=v0.4.0
pkgrel=1
pkgdesc="Next-gen integrity checker written in Rust"
provides=('websum')
arch=(x86_64)
url="https://github.com/yilmaz08/websum"
license=('MIT')
conflicts=('websum-git')
source=("$_reponame-$pkgver::https://github.com/yilmaz08/$_reponame/releases/download/$pkgver/$_reponame-$pkgver")
sha256sums=('4d1ea4b69dc1f947f8301353994601bf12d7e1a05fb7d8e881a90790e7d78a53')

package() {
	install -Dm755 $srcdir/$_reponame-$pkgver "${pkgdir}/usr/bin/${_reponame}"
}
