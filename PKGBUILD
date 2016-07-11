# Maintainer: Adam Ehlers Nyholm Thomsen <adament@adament.net
pkgname=git-remote-gcrypt
pkgver=1.0.0
pkgrel=1
pkgdesc="A git remote helper for GPG-encrypted remotes."
arch=(any)
url=https://spwhitton.name/tech/code/git-remote-gcrypt/
license=(GPL)
makedepends=(git python-docutils)
depends=(git gnupg bash)
conflicts=(git-remote-gcrypt-git)
source=(https://github.com/spwhitton/git-remote-gcrypt/archive/$pkgver.tar.gz)
sha256sums=('dfc557cab3dcd3bb0e0a0660d0bae710dffa8cfc0c6bae308d7dd88e2f84553e')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    DESTDIR="$pkgdir/" prefix="/usr" ./install.sh
}
