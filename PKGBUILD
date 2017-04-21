# Maintainer: 4679kun <4679kun@outlook.com>

pkgname=httpstat-go
_pkgname=httpstat
pkgver=1.0.0
pkgrel=1
pkgdesc="It's like curl -v, with colours."
arch=('x86_64' 'i686')
url="https://github.com/davecheney/httpstat"
license=('MIT')
if [ "$CARCH" = "i686" ]; then
  _PKGARCH=386
else
  _PKGARCH=amd64
fi
source_x86_64=("httpstat::https://github.com/davecheney/httpstat/releases/download/v1.0.0/httpstat-linux-amd64-v1.0.0")
source_i686=("httpstat::https://github.com/davecheney/httpstat/releases/download/v1.0.0/httpstat-linux-386-v1.0.0")
md5sums_x86_64=('9389453ae98f90c1514ae4b60049ac10')
md5sums_i686=('9389453ae98f90c1514ae4b60049ac10')

package() {
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
