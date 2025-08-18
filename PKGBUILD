# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=aicommits
pkgver=1.11.0
pkgrel=3
pkgdesc='A CLI that writes your git commit messages for you with AI'
arch=('any')
url="https://github.com/Nutlope/$pkgname"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('b74cf25eb31eb7098d01f482cd64a87e2f59d7efa11f5273fbb353f35e850c5d')

package() {
    npm install --global --prefix "$pkgdir/usr" --cache npm-cache $pkgname-$pkgver.tgz
    install -Dm644 package/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
