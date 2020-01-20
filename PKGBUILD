# Maintainer: Nicolas Trüssel <ntruessel@njsm.de>
pkgname=mkinitcpio-bootmsg
pkgver=0.2.0
pkgrel=1
pkgdesc="Mkinitcpio hook to display a message on boot"
arch=(any)
url="https://github.com/ntruessel/mkinitcpio-bootmsg"
license=('custom:UNLICENSE')
depends=('bash')
makedepends=('git')
backup=('etc/bootmsg.conf')
install="$pkgname.install"
source=("https://github.com/ntruessel/mkinitcpio-bootmsg/archive/v${pkgver}.tar.gz")
b2sums=('f958d105ef69290ce575d0ca3428c6dafb00d810ad380a5c069da51e0d5c0cb3d2ca3a240a1a4ddc0d5fce71705af9a935d6274e151e64e74b09b59843e0feea')

package() {
	cd "mkinitcpio-bootmsg-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
