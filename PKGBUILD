# Maintainer: JunYoung Gwak <aur@jgwak.com>
# Contributor: Adam Ehlers Nyholm Thomsen <adament@adament.net>
# Contributor: Sebastian Jug <seb@stianj.ug>

pkgname='git-remote-gcrypt'
pkgver='1.4'
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
sha256sums=('12567395bbbec0720d20ec0f89f6f54a7fae4cafedab0fc917164f0deb6b1ef5')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    DESTDIR="$pkgdir/" prefix="/usr" ./install.sh
}
