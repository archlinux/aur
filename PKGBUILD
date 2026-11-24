# Maintainer: Pierre Sauvage <m.sauvage.pierre@gmail.com>
pkgname=passel-bin
_pkgname=passel
pkgver=0.2.0
pkgrel=1
pkgdesc="A pass-compatible password manager for GNOME (prebuilt binary)"
arch=('x86_64')
url="https://github.com/Pierrotws/passel"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'gpgme' 'libgit2' 'libssh2' 'gnupg')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" 'gnome-vault' 'gnome-vault-bin')
replaces=('gnome-vault-bin')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64.tar.gz")
# Replace per release with the sha256 published next to the tarball, or
# regenerate locally with `updpkgsums`.
sha256sums=('7e50a0622e434989a082e349e56a02dac392f3f22f98fdde7b788933c600cf59')

package() {
    cp -a "$srcdir/usr" "$pkgdir/"
}
