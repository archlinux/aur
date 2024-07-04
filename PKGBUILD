pkgname=upg
pkgver=1.1
pkgrel=1
pkgdesc="A very simple shell script designed to automate common tasks related to Linux package managers, along with some extras."
arch=('any')
url="https://github.com/Xatra1/upg"
pkgdir=pkg
license=('GPL3')
depends=('bash')
makedepends=('git')
source=(
    "https://github.com/Xatra1/upg/releases/download/v${pkgver}/upg"
    "https://github.com/Xatra1/upg/releases/download/v${pkgver}/upg.1.gz"
    "https://github.com/Xatra1/upg/raw/main/LICENSE"
    )
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)
package() {
    install -Dm755 upg "${pkgdir}/usr/bin/upg"
    install -Dm644 upg.1.gz "${pkgdir}/usr/share/man/man1/upg.1"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
