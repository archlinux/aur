# Maintainer: Tomasz Zok <tomasz.zok [at] gmail.com>
pkgname=orchent
pkgver=0.2.0
pkgrel=1
pkgdesc="Orchestrator Command Line Client"
arch=(x86 x86_64)
url="https://github.com/indigo-dc/orchent"
license=('Apache')
depends=('go>=1.5')
source=(https://github.com/indigo-dc/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('c6ee304e51e5efc6afefad218f2af1b4')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
    install -D ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
