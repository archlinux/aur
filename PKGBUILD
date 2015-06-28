# Contributor:  Leslie P. Polzer <polzer@stardawn.org>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=ctcs
pkgver=1.4.1
pkgrel=1
epoch=
pkgdesc="CTorrent Control Server (CTCS), an interface for monitoring and managing Enhanced CTorrent clients."
arch=('i686' 'x86_64')
url="http://www.rahul.net/dholmes/ctorrent/ctcs.html"
license="GPL"
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.rahul.net/dholmes/ctorrent/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('7dfe725e558eb75258a2199f2aa9fdbc')
sha1sums=('228090d17dbf00d32129f6a2fbc874314f525998')
sha256sums=('9614e88d07c6b128677d4d2638a4a05ae00812ec5157ae0788012abed3172355')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 ctcs $pkgdir/usr/bin/ctcs
    install -Dm644 readme.txt $pkgdir/usr/share/doc/$pkgname/readme.txt
}

