# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

# https://www.mathworks.com/help/install/ug/get-mpm-os-command-line.html

_name="mpm"
pkgname="matlab-${_name}"
pkgver=2025.1
pkgrel=1
pkgdesc="MATLAB Package Manager"
arch=('x86_64')
url="https://www.mathworks.com/products/mpm.html"
license=('cusstom:MATLAB EULA')
depends=('ca-certificates' 'glibc' 'unzip')
_pkgsrc="${_name}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64::https://ssd.mathworks.com/supportfiles/downloads/${_name}/${pkgver}/glnxa64/${_name}")
sha256sums_x86_64=('09a430390e93919c95272b3178ebd29468d600791a6e1f2200c48bb25d675243')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_name}"
}
