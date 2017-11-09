# Maintainer: Adam Ehlers Nyholm Thomsen <adament@adament.net>
# Contributor: Sebastian Jug <seb@stianj.ug>

pkgname='git-remote-gcrypt'
pkgver='1.0.2'
pkgrel=1
pkgdesc='A git remote helper for GPG-encrypted remotes.'
arch=(any)
url='https://spwhitton.name/tech/code/git-remote-gcrypt/'
license=(GPL)
makedepends=(git python-docutils)
depends=(git gnupg bash)
conflicts=(git-remote-gcrypt-git)
source=("https://git.spwhitton.name/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
sha256sums=('002994d60d4b3c9a93452d2655bdf3e761c581159431f743d0827127d88f7be2')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    DESTDIR="$pkgdir/" prefix="/usr" ./install.sh
}
