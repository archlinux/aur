# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname="kubectl-df-pv"
_pkgname="df-pv"
pkgver="0.2.7"
pkgrel=1
pkgdesc="kubectl plugin - giving admins df (disk free) like utility for persistent volumes"
arch=('x86_64')
url="https://github.com/yashbhutwala/kubectl-df-pv"
license=('Apache-2.0')
source=("https://github.com/yashbhutwala/${pkgname}/releases/download/v${pkgver}/${pkgname}_v${pkgver}_linux_amd64.tar.gz")
sha256sums=('40388f2d0f8fad43ca2028f677400c71abc6dcb27a8bbc055d8a26461364285b')

package() {
  mkdir -p "${pkgdir}/usr/local/bin"
  install -Dm755 "${_pkgname}" "$pkgdir/usr/local/bin/${_pkgname}"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
