# Maintainer: George Dietrich <george@dietrich.app>
pkgname=oq-bin
pkgver=1.3.2
pkgrel=1
pkgdesc='A performant, and portable jq wrapper to facilitate the consumption and output of formats other than JSON; using jq filters to transform the data.'
arch=('x86_64')
url='https://github.com/blacksmoke16/oq'
license=('MIT')
depends=('jq')
conflicts=('oq')
provides=('oq')
source=("oq-$pkgver::$url/archive/v$pkgver.tar.gz")
sha256sums=('5216b16a874e7c0e74d4e735c593c1d353061f91fac4e455f6af7975c6c22bc3')
source_x86_64=("$url/releases/download/v$pkgver/oq-v$pkgver-linux-$CARCH")
sha256sums_x86_64=('0a16a7d4c3a842eaf9f12fc36c9f1e175d91ecabff0737c496c5ae66fd523be8')

package() {
  install -Dm755 "oq-v$pkgver-linux-$CARCH" "$pkgdir/usr/bin/oq"
  install -Dm644 "oq-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
