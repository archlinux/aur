# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="gomphotherium"
pkgname="${_pkgname}-bin"
pkgver=0.4.0
pkgrel=1
pkgdesc="A command line Mastodon client"
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://xn--gckvb8fzb.com/gomphotherium-a-command-line-mastodon-client/"
_url="https://github.com/mrusme/${_pkgname}"
license=('GPL-3.0-only')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.tar.gz")
source_armv6h=("${_pkgsrc}-armv6h.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_armv6.tar.gz")
source_armv7h=("${_pkgsrc}-armv7h.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_armv7.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_386.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.tar.gz")
sha256sums_aarch64=('712696420c354585c75fea9789319c236478d5a7edfa1147ef987f0f9ef3c37e')
sha256sums_armv6h=('d8b1c2d6b5cc07a43e9a60ac7344d4aec2ad33ab4519def72130ca26d7416254')
sha256sums_armv7h=('6886d9b596178f1f7e6d0247d5b8ff4f5fceac684d036058758c184db18b6eb6')
sha256sums_i686=('48021ba334b445cecc94f8a8bceba9310e17708a93085ba1015d0e395ebb8cbc')
sha256sums_x86_64=('b27dc0906c0f6a3f37b7897ecc4137447cea1a26c08e74d08965b25a4a021dd2')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
