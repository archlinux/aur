# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=ssh-audit
pkgver=1.6.0
pkgrel=1
pkgdesc="A tool for ssh server auditing."
arch=(any)
url="https://github.com/arthepsy/ssh-audit"
license=('MIT')
depends=('python')
source=("https://github.com/arthepsy/ssh-audit/archive/v${pkgver}.tar.gz")
sha256sums=('efebff6d39f270cde5e235f1e3cbaedd8a56e693c810e91dd4a48aaceb0ca2dd')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -m755 -d "${pkgdir}/usr/bin"
  install -m755 ssh-audit.py "${pkgdir}/usr/bin/ssh-audit"
  install -m755 -d "${pkgdir}/usr/share/doc/ssh-audit"
  install -m644 README.md "${pkgdir}/usr/share/doc/ssh-audit/"
}
