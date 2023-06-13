pkgname=spyglass-bin
pkgver=23.5.1
pkgrel=1
pkgdesc="A personal search engine that indexes what you want, exposing it to you in a simple & fast interface"
arch=('x86_64')
url="https://github.com/spyglass-search/spyglass"
license=("AGPL3")
source_x86_64=("https://github.com/spyglass-search/spyglass/releases/download/v20${pkgver}/spyglass_${pkgver}_amd64.deb")
sha256sums_x86_64=('6bf3e6afc65d6bd5d4ff9df9bf14bc324cd2685077f9f9d130d199c201432499')

package() {
  tar -xvf 'data.tar.gz' -C "${pkgdir}"
  rm "${pkgdir}/usr/bin/pdftotext"
  install -dv "${pkgdir}/usr/bin"
}
