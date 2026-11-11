# Maintainer: agony <27015 at riseup dot net>

pkgname=evernote2md-bin
pkgver=0.23.0
pkgrel=1
pkgdesc='Convert Evernote .enex export files to Markdown (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/wormi4ok/evernote2md'
license=('MIT')
provides=("evernote2md=${pkgver}")
conflicts=('evernote2md')
_release="${url}/releases/download/v${pkgver}"
source=("evernote2md-${pkgver}-LICENCE::https://raw.githubusercontent.com/wormi4ok/evernote2md/v${pkgver}/LICENCE")
source_x86_64=("${_release}/evernote2md_${pkgver}_Linux_amd64.tar.gz")
source_aarch64=("${_release}/evernote2md_${pkgver}_Linux_arm64.tar.gz")
sha256sums=('a32aff4094dbc9bc1eb15452b5312032f28490e3a0ed1310f199583b80ebfbc0')
sha256sums_x86_64=('e23e9bdf60f9f5e4bc3fe66121acb94d2c678d75d7f6f55e6e5e9985054b26fd')
sha256sums_aarch64=('5b449e894dab4559fc0546b324c3e08172293c53e537b17f7b6c2fcb53f00170')

package() {
  install -Dm755 evernote2md -t "${pkgdir}/usr/bin"
  install -Dm644 "evernote2md-${pkgver}-LICENCE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
}
