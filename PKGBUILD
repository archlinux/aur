# Maintainer: Mai Lawton
# Contributor: Mai Lawton
pkgname=discordupdater
pkgver=1
pkgrel=1
pkgdesc="Discord updating script by maidado"
arch=('x86_64')
url='https://github.com/maidado/discordupdater'
depends=('wget' 'bash' 'discord')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('SKIP')
build() {
   cd "$pkgname-$pkgver"
}

package() {
   cd "$pkgname-$pkgver"
   make install DESTDIR="$pkgdir" PREFIX=/usr
}

