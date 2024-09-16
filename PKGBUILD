# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="neonmodem"
pkgname="${_pkgname}-bin"
pkgver=1.0.6
pkgrel=1
pkgdesc="A BBS-style, multi-backend discussion board TUI"
arch=('x86_64' 'i686' 'aarch64' 'armv6h' 'armv7h')
url="https://neonmodem.com"
_url="https://github.com/mrusme/${_pkgname}"
license=('GPL-3.0-or-later')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_armv6h=("${_pkgsrc}-armv6h.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
source_armv7h=("${_pkgsrc}-armv7h.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv7.tar.gz")
b2sums_x86_64=('27090ce2e40e0a67c47df3d4c1abc6d34876cf7b23776f1fa72a28c797235472786224403c3e91dbc7a847d7bda0de5415875ac046034c4e2bed7bc1facd3521')
b2sums_i686=('559501eee4800ec108a0dcce99a5873a39e6331df5c6bb054ff0d8d89cef58caacd5515498b1530d5ed48b1354d71e9887f1b84abd2741ebcc34d9aba451a9ad')
b2sums_aarch64=('960f5f3e92e35765101f9c9ebd46f678b8e49bcd2a6cd48bebf472a80d91469d5afcc3852e82f6ab8dea95761e4cc9287bb53cca73d918a3d92cf7549d0788e2')
b2sums_armv6h=('aa768a1407aa96f27cf422b65a03994a1e044de45e413bb1a0b2c4cd0a312acd63a50fe78f14123fffe24cbcf172b8d7d7e744b3a707ad4df4cdb7c57d80d15b')
b2sums_armv7h=('acdbddb7551434b315d482cd51dc0c98cb88296288bd2b942cc695851f5a01ca4eaf9b88856fbe47e06821e975e617d668d8e3c0d1edfdda095ec25bfa117af4')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
