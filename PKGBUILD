# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=lexicmap-bin
_pkgname=lexicmap
pkgver=0.9.0
pkgrel=1
pkgdesc="Efficient sequence alignment tool for querying nucleotide sequences against millions of prokaryotic genomes"
arch=('x86_64')
url="https://github.com/shenwei356/LexicMap"
license=('MIT')
provides=('lexicmap')
conflicts=('lexicmap')
options=('!strip' '!debug')
source=(
  "https://github.com/shenwei356/LexicMap/releases/download/v${pkgver}/lexicmap_linux_amd64.tar.gz"
  "https://raw.githubusercontent.com/shenwei356/LexicMap/v${pkgver}/LICENSE"
)
sha256sums=('54dea6a35e0c1a25025ad649da47d7cc7f6190ae69e44624db9685bf3c0dd662'
            '5e5e14f46e2a6dff0a8ad39f2ef48fc8c0a0535ff6c141393a2a4ed465e2abb3')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
