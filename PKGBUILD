# Maintainer: Yufan You <ouuansteve at gmail>
# Contributor: Radoslaw Mejer <radmen@radmen.info>

pkgname=neuron-zettelkasten-bin
pkgver=1.9.35.0
pkgrel=1
pkgdesc="Future-proof note-taking and publishing based on Zettelkasten"
arch=(x86_64)
url="https://github.com/srid/neuron"
license=('AGPL-3.0-only')
source_x86_64=("https://github.com/srid/neuron/releases/download/${pkgver}/neuron"
               "neuron.sh")
sha256sums_x86_64=('f16eedd05ca71f3f0e323072c95e4ee457feba8aa85e982154b2015515e88bb6'
                   '1cfc1b63aeb82d69abaf48a737551fb43a9283d7d694310dcd802119a3bfd159')

package() {
  install -Dm755 ${srcdir}/neuron ${pkgdir}/opt/${pkgname}/neuron
  install -Dm755 ${srcdir}/neuron.sh ${pkgdir}/usr/bin/neuron
}
