# Maintainer: George Dietrich <george@dietrich.app>
pkgname=oq-bin
pkgver=1.3.0
pkgrel=1
pkgdesc='A performant, and portable jq wrapper to facilitate the consumption and output of formats other than JSON; using jq filters to transform the data.'
arch=('x86_64')
url='https://github.com/blacksmoke16/oq'
license=('MIT')
depends=('jq')
conflicts=('oq')
provides=('oq')
source=("oq-$pkgver::$url/archive/v$pkgver.tar.gz")
sha256sums=('5bfb23b0c527f45eacd40485779c708b1a05dd36015b50b84df29c2ac3f6cdac')
source_x86_64=("$url/releases/download/v$pkgver/oq-v$pkgver-linux-$CARCH")
sha256sums_x86_64=('fffee4b9a453e32798f1f4762faef887eb25a26573cc140051be725ab4e04da4')

package() {
  install -Dm755 "oq-v$pkgver-linux-$CARCH" "$pkgdir/usr/bin/oq"
  install -Dm644 "oq-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
