# Maintainer: Tomasz Zok <tomasz.zok [at] gmail.com>
pkgname=orchent
pkgver=1.2.6
pkgrel=1
pkgdesc="Orchestrator Command Line Client"
arch=(x86 x86_64)
url="https://github.com/indigo-dc/orchent"
license=('Apache')
depends=('go>=1.5')
source=(https://github.com/indigo-dc/$pkgname/archive/$pkgver.tar.gz)
md5sums=('af862712fea35815939730227c792c6d')

build() {
    cd "$pkgname-$pkgver"
    utils/compile.sh
}

package() {
    cd "$pkgname-$pkgver"
    install -D ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
