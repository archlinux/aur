# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="superhighway84"
pkgname="${_pkgname}-bin"
pkgver=0.2.4
pkgrel=1
pkgdesc="USENET-inspired, uncensorable, decentralized internet discussion system running on IPFS & OrbitDB"
arch=('x86_64' 'aarch64' 'i686' 'armv6h' 'armv7h')
url="https://xn--gckvb8fzb.com/superhighway84"
_url="https://github.com/mrusme/${_pkgname}"
license=('GPL-3.0-or-later')
depends=('kubo')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_386.tar.gz")
source_armv6h=("${_pkgsrc}-armv6h.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_armv6.tar.gz")
source_armv7h=("${_pkgsrc}-armv7h.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_armv7.tar.gz")
sha256sums_x86_64=('d3fe5594f1346a6d3a84c3ba8e20aa165bfd1305f04dad4a5ea47af636c1d08c')
sha256sums_aarch64=('8ddfef36bc5e325a1f3f81824ed432bf483106540519054abd4f7e3b8b8cc8ad')
sha256sums_i686=('d1857572c94dc7399f8806e3c47dfc68cbc0c83ea060f48527b3ff32767d03de')
sha256sums_armv6h=('6036a4187b819f6711dccc492babad4eba93718e33c3abb4658f770a2567287f')
sha256sums_armv7h=('2c6a64cc43c288c29d88fbd86a8aa987731deee79f81ba0948dc5d26d5bc1929')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
