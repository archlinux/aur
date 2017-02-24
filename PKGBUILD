# Maintainer: Tomasz Zok <tomasz.zok [at] gmail.com>
pkgname=orchent
pkgver=0.3.1
pkgrel=1
pkgdesc="Orchestrator Command Line Client"
arch=(x86 x86_64)
url="https://github.com/indigo-dc/orchent"
license=('Apache')
depends=('go>=1.5')
source=(https://github.com/indigo-dc/$pkgname/archive/$pkgver.tar.gz)
md5sums=('f147ec790de3e59a766b5e18663ef842')

build() {
	cd "$pkgname-$pkgver"
    utils/compile.sh
}

package() {
	cd "$pkgname-$pkgver"
    install -D ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
