# Maintainer: Frederick Zhang <frederick888@tsundere.moe>
# Contributor: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname=q
pkgver=3.1.6
pkgrel=1
pkgdesc="SQL-like queries on tabular text data, including joins and subqueries"
url="https://github.com/harelba/q"
license=('GPL3')
arch=('x86_64')
depends=('python')
source=("https://github.com/harelba/q/releases/download/v${pkgver}/q-text-as-data-${pkgver}.x86_64.rpm"
        "https://raw.githubusercontent.com/harelba/q/v${pkgver}/LICENSE")
sha256sums=('efd0473f2487dbc1e6d323c93f887d1796851dbb59fca731fbe96ac270c16cce'
            '589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2')

package() {
  install -D -m755 "${srcdir}/usr/bin/q" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/q-text-as-data/LICENSE"
  install -D -m644 "${srcdir}/usr/share/man/man1/${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}

# vim: set tabstop=4 shiftwidth=2 expandtab smarttab autoindent:
