# Maintainer: Farhad Mehdizade (@ferhadme) <frhdmehdiyev@gmail.com>

pkgname=git-summmary
pkgver=1.0.2
pkgrel=1
pkgdesc="Recursive Git summary using git-extras"
arch=('any')
url="https://github.com/ferhadme/git-summmary"
license=('MIT')
depends=('perl' 'git-extras')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('38b2fadeb56496e441d7bad6a0bce317a5f0b961db488e25f8839bf0022ae986')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 git-summmary "$pkgdir/usr/bin/git-summmary"
}
