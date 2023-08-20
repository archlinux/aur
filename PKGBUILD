# Maintainer A. Kulkarni <cd+aur [shift-2] terminal.space>

pkgname=systemd-boot-lifeboat
pkgver=0.0.5
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
sha256sums=('921bdca0a3c73707f3467ceba2ffbc34b8482f7bd1feb3565e4bbb368f0e9ab6')
