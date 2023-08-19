# Maintainer A. Kulkarni <cd+aur [shift-2] terminal.space>

pkgname=systemd-boot-lifeboat
pkgver=0.0.4
pkgrel=1
pkgdesc="Keep rotating backups of systemd-boot bootloader entries"
arch=('any')
license=('MIT')
depends=('python')
url='https://github.com/intentionally-left-nil/systemd-boot-lifeboat'
_snapshot="${pkgname}-${pkgver}"
source=("${_snapshot}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

package() {
  install -D -m0755 "${srcdir}/${_snapshot}/systemd_boot_lifeboat.py" "${pkgdir}/usr/share/systemd-boot-lifeboat/systemd_boot_lifeboat.py"
  install -D -m0644 "${srcdir}/${_snapshot}/systemd-boot-lifeboat.service" "${pkgdir}/usr/lib/systemd/system/systemd-boot-lifeboat.service"
}

sha256sums=('fb49f428ab91cac645737c343f52b7613dc9aebf0ca0c23b8531b19a968f4b66')
