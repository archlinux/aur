# Maintainer: Farhad Mehdizade (@ferhadme) <frhdmehdiyev@gmail.com>

pkgname=git-summmary
pkgver=1.0.3
pkgrel=1
pkgdesc="Recursive Git summary using git-extras"
arch=('any')
url="https://github.com/ferhadme/git-summmary"
license=('MIT')
depends=('perl' 'git-extras')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f50cab95327c01d43d6427c365baeac09f3d93c2f384fc8364f440d13677b189')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 git-summmary "$pkgdir/usr/bin/git-summmary"
}
