# Maintainer: Adam Ehlers Nyholm Thomsen <adament@adament.net
pkgname=git-remote-gcrypt
pkgver=1.0.1
pkgrel=1
pkgdesc="A git remote helper for GPG-encrypted remotes."
arch=(any)
url=https://spwhitton.name/tech/code/git-remote-gcrypt/
license=(GPL)
makedepends=(git python-docutils)
depends=(git gnupg bash)
conflicts=(git-remote-gcrypt-git)
source=(https://github.com/spwhitton/git-remote-gcrypt/archive/$pkgver.tar.gz)
sha256sums=('fbc937300c4b1951a88c67407d659f2577845562eeca5d220e9a187c4631fa64')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    DESTDIR="$pkgdir/" prefix="/usr" ./install.sh
}
