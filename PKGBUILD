# Maintainer: jjacky
pkgname=auto-rsync-backups
pkgver=1.0.2
pkgrel=1
pkgdesc="little script to handle/rotate rsync backups"
arch=('any')
url="https://bitbucket.org/jjacky/backups"
license=('GPL3')
depends=('bash' 'rsync')
install='install'
source=(https://bitbucket.org/jjacky/backups/get/$pkgver.tar.gz)
sha1sums=('eacc0d7db3ffa4539f0db013e3dc3e036a8b5e86')

package() {
  install -D -m755 backups.sh "${pkgdir}/usr/bin/backups.sh"
  install -D -m755 restore.sh "${pkgdir}/usr/bin/restore.sh"
  install -D -m644 backups.common "${pkgdir}/usr/bin/backups.common"
  install -D -m644 backups.sample.conf "${pkgdir}/usr/share/${pkgname}/backups.conf"
  install -D -m644 backups.excludes "${pkgdir}/usr/share/${pkgname}/backups.excludes"
}
