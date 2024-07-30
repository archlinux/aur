# Maintainer: Ahmet Arda Kavakcı <ahmetardakavakci@gmail.com>

pkgname=websum-bin
_reponame=websum
pkgver=v0.3.1
pkgrel=1
pkgdesc="Next-gen integrity checker written in Rust"
provides=('websum')
arch=(x86_64)
url="https://github.com/yilmaz08/websum"
license=('MIT')
conflicts=('websum-git')
source=("$_reponame-$pkgver::https://github.com/yilmaz08/$_reponame/releases/download/$pkgver/$_reponame-$pkgver")
sha256sums=('2400394c5a54e8c6ded0a3c2b3fdac517959d51391a55760bad41e91cade36f0')

package() {
	install -Dm755 $srcdir/$_reponame-$pkgver "${pkgdir}/usr/bin/${_reponame}"
}
