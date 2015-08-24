# Contributor: Fabian Beutel <fabian.beutel at gmx dot de>
pkgname='mkinitcpio-smartcard'
pkgver=0.1.0
pkgrel=1
pkgdesc='mkinitcpio hook for two-factor authentication using a PGP smartcard and GnuPG'
url='https://bitbucket.org/fbeutel/mkinitcpio-smartcard'
arch=('any')
license=('GPL')
depends=('mkinitcpio>=0.9.0' 'gnupg' 'pcsclite')
source=('smartcard_hook' 'smartcard_install')

package() {
    install -o root -g root -D ${srcdir}/smartcard_install ${pkgdir}/usr/lib/initcpio/install/smartcard
    install -o root -g root -D ${srcdir}/smartcard_hook    ${pkgdir}/usr/lib/initcpio/hooks/smartcard
}

md5sums=('e871af7f97fdda1554bde59e99640818'
         '438345555e5e9ac759c1f7270ed52aeb') 
