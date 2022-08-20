# Maintainer A. Kulkarni <cd+aur [shift-2] terminal.space>

pkgname=systemd-boot-lifeboat
pkgver=0.0.1
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
sha256sums=('9c3959e7768b0406cb3723a4b98e8eee2f5703b1ec1d81f5f8b0069b0ff1d700')

