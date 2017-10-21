# Maintainer: Tomasz Zok <tomasz.zok [at] gmail.com>
pkgname=orchent
pkgver=1.2.0
pkgrel=1
pkgdesc="Orchestrator Command Line Client"
arch=(x86 x86_64)
url="https://github.com/indigo-dc/orchent"
license=('Apache')
depends=('go>=1.5')
source=(https://github.com/indigo-dc/$pkgname/archive/$pkgver.tar.gz)
md5sums=('5e09785f65f09add07d5c9984d03aaa5')

build() {
	cd "$pkgname-$pkgver"
    utils/compile.sh
}

package() {
	cd "$pkgname-$pkgver"
    install -D ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
