# Maintainer: Radoslaw Mejer <radmen@radmen.info>

pkgname=neuron-zettelkasten-bin
pkgver=1.0.1.0  
pkgrel=2
pkgdesc="Future-proof command-line app for managing your plain-text Zettelkasten notes"
arch=(x86_64)
url="https://github.com/srid/neuron"
license=(AGPL3)
depends=()
conflicts=()
source_x86_64=("https://github.com/srid/neuron/releases/download/${pkgver}/neuron-${pkgver}-linux.tar.gz")
sha256sums_x86_64=('25d0c2c27e8840ec527ea66823844bf880fc00b3dd43b171d93b99172f4afa2b')

package() {
  install -Dm655 ${srcdir}/neuron ${pkgdir}/usr/bin/neuron
}
