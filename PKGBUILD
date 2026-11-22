# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=seqsizzle-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="A terminal pager for viewing and searching FASTA and FASTQ DNA sequence files"
arch=('x86_64')
url="https://github.com/ChangqingW/SeqSizzle"
license=('AGPL-3.0-or-later')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/ChangqingW/SeqSizzle/v${pkgver}/LICENSE.md")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/seqsizzle-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('8d56b405468aad11f87ab5763f901e276e08d9646ff5c8481b1762b6b789e9ed')
sha256sums_x86_64=('5f482297f5bc9c99b6df47c978139086072d8b1391748eeb0b78a96cd0c3701d')

package() {
  install -Dm755 "seqsizzle" "${pkgdir}/usr/bin/seqsizzle"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
