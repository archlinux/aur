# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="ptsh"
pkgname="${_pkgname}-bin"
pkgver=0.4
pkgrel=2
pkgdesc="Visually customizable shell utils"
arch=(
  'i686'
  'x86_64'
)
url="https://github.com/jszczerbinsky/ptSh"
license=(
  'MIT'
)
depends=(
  'bash'
  'glibc'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
source_i686=(
  "${url}/releases/download/v${pkgver}/ptSh_v${pkgver}-linux_i686.zip"
)
source_x86_64=(
  "${url}/releases/download/v${pkgver}/ptSh_v${pkgver}-linux_x86_64.zip"
)
sha256sums_i686=('920b12bd5a080b19407f6fe859bab1412e2411e734d38807dff929a0ef24ec01')
sha256sums_x86_64=('3e83cf8269ab5c58aedc5df1b7cb3dccf6255fb546afe6a430c1a68b3cbc2b33')

package() {
  cd "${srcdir}"
  install -vd "${pkgdir}/usr"
  cp -va --no-preserve=ownership -t "${pkgdir}/usr" \
    "bin" "share"
}
