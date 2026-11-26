# Maintainer: Pierre Sauvage <m.sauvage.pierre@gmail.com>
pkgname=passel-bin
_pkgname=passel
pkgver=0.3.0
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
sha256sums=('c842cc7b5ead6e08512eff9583cf5bafbf0675f4a33a1fe38ab10eb38e791c9d')

package() {
    cp -a "$srcdir/usr" "$pkgdir/"
}
