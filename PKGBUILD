# Maintainer: Olivia May <olmay@tuta.io>
pkgname=livsdiary
pkgver=1.1.4
pkgrel=1
pkgdesc="A simple, free/libre and open source command-line diary"
arch=('x86_64')
url="https://github.com/olivia-livs/$pkgname"
license=('GPL3')
source=("https://github.com/olivia-livs/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('122dc1a45662128cdc60767e84e43304c28f06ab5b46482d3002c3dc49e94083')

build()
{
        cd "$pkgname-$pkgver"
        make
}
package()
{
        cd "$pkgname-$pkgver"
        install -D livsdiary.o "${pkgdir}/usr/bin/livsdiary"
}
