# Maintainer: Mika Naylor <mail@autophagy.io>

pkgname=crash-standalone
pkgver=0.25.0
pkgrel=2
pkgdesc="The CrateDB Shell (Crash) CLI tool for interacting with CrateDB clusters."
arch=('any')
url="https://github.com/crate/crash"
license=('apache')
depends=('python')
conflicts=('crash')
source=("https://cdn.crate.io/downloads/releases/crash_standalone_${pkgver}"
        "https://raw.githubusercontent.com/crate/crash/master/LICENSE")
sha256sums=('d6979cc78285aace6063dc528d7d0baa4692393f7beb3d71cd146cc6e270f5c1'
            '5641831695c5aff3cd507cda5353a8f0e5d0916f8f3401d957e49cc9a703952a')

package() {
  install -Dm755 "crash_standalone_${pkgver}" "${pkgdir}/usr/bin/crash"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/crash-standalone"
}

