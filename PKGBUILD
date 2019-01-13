# Maintainer: JunYoung Gwak <i@jgwak.com>
# Contributor: Adam Ehlers Nyholm Thomsen <adament@adament.net>
# Contributor: Sebastian Jug <seb@stianj.ug>

pkgname='git-remote-gcrypt'
pkgver='1.2'
pkgrel=1
pkgdesc='A git remote helper for GPG-encrypted remotes.'
arch=(any)
url='https://spwhitton.name/tech/code/git-remote-gcrypt/'
license=(GPL)
makedepends=(git python-docutils)
depends=(git gnupg bash)
optdepends=('rsync: rsync backend support'
            'curl: sftp backend support'
            'rclone: rclone backend support')
conflicts=(git-remote-gcrypt-git)
source=("https://git.spwhitton.name/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6f00d5891639f8d2c263ca15b14ad02bb5a8dd048e9c778fcc12a38cb26f51c4')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    DESTDIR="$pkgdir/" prefix="/usr" ./install.sh
}
