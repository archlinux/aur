#Maintainer: Nicroxio <Nic _at_ nicroxio dot co dot uk>
pkgname=shronk-cli-utils-git
pkgver=1.0.2
pkgrel=0
pkgdesc="A compilation of my own CLI Utils"
arch=("x86_64")
url="https://github.com/nicroxio/cli_utils"
license=('GPL3')
depends=("restic" "python" "python-click" "python-rich")
makedepends=("git")
source=("git+https://github.com/Nicroxio/cli_utils.git")
sha256sums=("SKIP" )


package() {
  cd ${srcdir}/cli_utils/cli_utils
  mkdir -p ${pkgdir}/usr/bin/
  chmod +x Backups.py
  chmod +x Systemd_service.py
	cp Backups.py ${pkgdir}/usr/bin/backup
  cp Systemd_service.py ${pkgdir}/usr/bin/mkservice
  }
