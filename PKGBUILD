# Maintainer: Max Harmathy <harmathy@alumni.tum.de>
# Contributor: JunYoung Gwak <aur@jgwak.com>
# Contributor: Adam Ehlers Nyholm Thomsen <adament@adament.net>
# Contributor: Sebastian Jug <seb@stianj.ug>ote-gcrypt'

pkgname='git-remote-gcrypt'
pkgver='1.5'
pkgrel=4
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
source=("git+https://git.spwhitton.name/git-remote-gcrypt#tag=${pkgver}")
sha256sums=('1d4ea10547f3948902e030d1f40687746ad02ef13534efcf2a9daaa9a7747c1b')

package() {
    cd "$srcdir/$pkgname"
    DESTDIR="$pkgdir/" prefix="/usr" ./install.sh
}
