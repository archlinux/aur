# Maintainer: Farhad Mehdizade (@ferhadme) <frhdmehdiyev@gmail.com>

pkgname=git-summmary
pkgver=1.0.1
pkgrel=2
pkgdesc="Recursive Git summary using git-extras"
arch=('any')
url="https://github.com/ferhadme/git-summmary"
license=('MIT')
depends=('perl' 'git-extras')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7f9708c8a3aea602f5951312b49c871368cd1dad5ad3dad2457a8cd3704b2c45')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 git-summmary "$pkgdir/usr/bin/git-summmary"
}
