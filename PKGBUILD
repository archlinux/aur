# Maintainer: faerbit <faerbit at gmail dot com >

pkgname=multigpg
pkgver=1.0
pkgrel=3
pkgdesc="A simple script that handles modifying the contents of a GPG encrypted archive."
arch=("any")
url="https://github.com/Faerbit/MultiGPG"
license=("MIT")
depends=("gnupg")
source=("https://github.com/Faerbit/MultiGPG/archive/RELEASE-$pkgver.zip")
sha256sums=('eb484c2282cba1637b53ef21df879bc8ea7f4181b6653adf4efd275862600f4b')

package(){
    cd "$srcdir/MultiGPG-RELEASE-$pkgver"
    install -D multigpg "$pkgdir/usr/bin/multigpg"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
