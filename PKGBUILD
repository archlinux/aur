# Submitter: Marcel Robitaille <mail@marcelrobitaille.me>
# Maintainer: Marcel Robitaille <mail@marcelrobitaille.me>
pkgname=arc-welder-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Anti Stutter Libraries and Binaries"
url='https://github.com/FormerLurker/ArcWelderLib'
arch=('x86_64' 'i686')
license=('unknown')
source=("https://github.com/FormerLurker/ArcWelderLib/releases/download/$pkgver/Linux.zip")
md5sums=('ea755417eb7d4c402a7a55816e7493fa')

package() {
    install -Dm755 bin/ArcWelder -t "$pkgdir/usr/bin/"
    cd "$pkgdir/usr/bin"
    ln -s ArcWelder arcwelder
}
