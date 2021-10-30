# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>
# Contributor: Elia A. <elia@elinvention.ovh>

pkgname=efibootmgr-gui
pkgver=0.1
pkgrel=1
pkgdesc="Manage EFI boot loader entries with this simple GUI"
url="https://github.com/Elinvention/efibootmgr-gui"
license=('GPL3')
arch=('any')
depends=('python-gobject' 'efibootmgr')
makedepends=('git')
optdepends=()
source=("git+$url.git#tag=$pkgver")
md5sums=('SKIP')

package() {
	install -Dm644 "$srcdir/$pkgname/efibootmgr.desktop" "$pkgdir/usr/share/applications/efibootmgr.desktop"
	install -Dm755 "$srcdir/$pkgname/efibootmgr_gui.py" "$pkgdir/usr/bin/efibootmgr-gui"
}
