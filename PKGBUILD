# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=ssh-audit
pkgver=1.7.0
pkgrel=1
pkgdesc="A tool for ssh server auditing."
arch=(any)
url="https://github.com/arthepsy/ssh-audit"
license=('MIT')
depends=('python')
source=("https://github.com/arthepsy/ssh-audit/archive/v${pkgver}.tar.gz")
sha256sums=('cba29cc19ec2932e4f43c720b2c49a7d179219e23482476aeb472f7463713b68')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -m755 -d "${pkgdir}/usr/bin"
  install -m755 ssh-audit.py "${pkgdir}/usr/bin/ssh-audit"
  install -m755 -d "${pkgdir}/usr/share/doc/ssh-audit"
  install -m644 README.md "${pkgdir}/usr/share/doc/ssh-audit/"
}
