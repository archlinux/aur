# Maintainer: Lorenzo Golluscio <149246609+ssupt@users.noreply.github.com>

pkgname=drmcru-bin
_pkgname=drmcru
pkgver=0.1.2
pkgrel=1
pkgdesc="Linux DRM/KMS custom resolution and EDID override utility"
arch=('x86_64')
url="https://github.com/ssupt/drmcru"
license=('GPL-3.0-or-later')
provides=('drmcru')
conflicts=('drmcru')
options=('!strip' '!debug')
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64-unknown-linux-musl")
sha256sums_x86_64=('9fc58f5a319ef71a4d3abd963974e87c455af396b58d00212efd69025a872dee')

package() {
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
