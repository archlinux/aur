# Maintainer: Max Harmathy <harmathy@alumni.tum.de>
# Contributor: JunYoung Gwak <aur@jgwak.com>
# Contributor: Adam Ehlers Nyholm Thomsen <adament@adament.net>
# Contributor: Sebastian Jug <seb@stianj.ug>ote-gcrypt'

pkgname='git-remote-gcrypt'
pkgver='1.5'
pkgrel=3
pkgdesc='A git remote helper for GPG-encrypted remotes.'
arch=(any)
url='https://spwhitton.name/tech/code/git-remote-gcrypt/'
license=("GPL-2.0-or-later OR GPL-3.0-or-later")
makedepends=(
    python-docutils
)
depends=(
    bash
    git
    gnupg
)
optdepends=(
    'curl: sftp backend support'
    'rclone: rclone backend support'
    'rsync: rsync backend support'
)
source=("https://git.spwhitton.name/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0a0b8359eccdd5d63eaa3b06b7a24aea813d7f1e8bf99536bdd60bc7f18dca03')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    DESTDIR="$pkgdir/" prefix="/usr" ./install.sh
}
