# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=mkinitcpio-kms
pkgver=1.0
pkgrel=1
pkgdesc="A hook to include common kernel modules for early KMS (from archiso)"
arch=('any')
url="http://www.archlinux.org/"
license=('GPL')
depends=('bash')
source=(archiso_kms)
md5sums=('c97b5720c31a1fec6d5da74cb65f8799')

package() {
	install -Dm644 archiso_kms "$pkgdir/usr/lib/initcpio/install/kms"
}
