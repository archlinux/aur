# Maintainer: strifel <me@strifel.de>

_name=oidc-debug
pkgname=${_name}-bin
pkgver=1.2.0
pkgrel=1
pkgdesc='Debug and test OIDC endpoints'
arch=('x86_64')
url='https://github.com/strifel/openid-connect-debugger'
license=('MIT')
provides=("${_name}")
conflicts=("${_name}")
# options=(!strip)

source_x86_64=("https://github.com/strifel/openid-connect-debugger/releases/download/${pkgver}/oidc-debug-linux")
sha256sums_x86_64=('359cbda89b298411f1d47ba29c105739b6276f206c83bf87c9df8a5a748273e6')
noextract=("oidc-debug-linux")

package() {
  install -Dm755 "${srcdir}/oidc-debug-linux" "${pkgdir}"/usr/bin/oidc
}

