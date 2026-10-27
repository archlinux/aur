# Maintainer: Darkstalker Kaathe <primordial dot serpent dot darkstalker dot kaathe at proton dot me>

pkgname=nixfmt-bin
_pkgname=nixfmt
pkgver=1.5.0
pkgrel=1
pkgdesc='The official formatter for Nix code'
arch=('x86_64')
url='https://github.com/NixOS/nixfmt'
license=('MPL-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug') # Already stripped, and there's no debug version
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}")
sha256sums_x86_64=('aa029247ab89c897e2f3948463967553f902f86e86e3402fa28cb29c4a44f745')

package() {
  install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
