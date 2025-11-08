# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=sal
pkgdesc="Markers for documenting the semantics of APIs"
pkgver=20240404
pkgrel=1
arch=('any')
url="https://github.com/dotnet/runtime"
license=('MIT')
source=(https://raw.githubusercontent.com/dotnet/runtime/5c4e2a301ec1dd8ef75a3ba98e5be1ff2cea0130/src/coreclr/pal/inc/rt/sal.h)
sha256sums=('e26ee611231a859b5a800eb2e1606e7ca03b8e3981d7c98cf1ca20c89b658b68')

package() {
  install -Dm644 sal.h "${pkgdir}/usr/include/sal.h"
}
