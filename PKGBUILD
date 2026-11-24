# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=journalot
pkgver=5.6.2
pkgrel=1
pkgdesc="Minimal git-backed journaling CLI for developers"
arch=('any')
url="https://github.com/jtaylortech/journalot"
license=('MIT')
depends=('bash' 'git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ccd9bc43020bfe7f20becf94bd2edc74a4f2b77074566fab3c8b84def99c3c92')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 bin/journal -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
