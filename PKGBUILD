# Maintainer: robertfoster

pkgname=xmysql
pkgver=0.4.9
pkgrel=1
pkgdesc="One command to generate REST APIs for any MySql Database"
arch=('i686' 'x86_64')
url="https://github.com/o1lab/xmysql/"
license=('MIT')
depends=('npm')
makedepends=('npm')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")

package() {
  npm install -g \
    --prefix "$pkgdir"/usr \
    --production "$srcdir"/$pkgver.tar.gz
}

sha256sums=('b2f8c8fe94a5c1830ad0179d77c3a1a1cfe9b28d2e887b8ec8df36e17292b04b')
