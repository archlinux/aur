# Submitter: Marcel Robitaille <mail@marcelrobitaille.me>
# Maintainer: Marcel Robitaille <mail@marcelrobitaille.me>
pkgname=arc-welder-bin-git
pkgver=1.1.1
pkgrel=1
pkgdesc="Anti Stutter Libraries and Binaries"
url='https://github.com/FormerLurker/ArcWelderLib'
arch=('x86_64' 'i686')
license=('unknown')
source=("https://github.com/FormerLurker/ArcWelderLib/releases/download/$pkgver/Linux_$pkgver.tar")
md5sums=('3b924a9800710b28d57f5c81e6b1708c')

package() {
    install -Dm755 bin/ArcWelder -t "$pkgdir/usr/bin/"
    cd "$pkgdir/usr/bin"
    ln -s ArcWelder arcwelder
}
