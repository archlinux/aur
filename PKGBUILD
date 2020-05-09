# Maintainer: JunYoung Gwak <aur@jgwak.com>
# Contributor: Adam Ehlers Nyholm Thomsen <adament@adament.net>
# Contributor: Sebastian Jug <seb@stianj.ug>

pkgname='git-remote-gcrypt'
pkgver='1.3'
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
sha256sums=('e1948dda848db845db404e4337b07206c96cb239b66392fd1c9c246279c2cb25')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    DESTDIR="$pkgdir/" prefix="/usr" ./install.sh
}
