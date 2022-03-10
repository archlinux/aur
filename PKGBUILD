# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname="datree-bin"
_pkgname='datree'
pkgver="0.15.52"
pkgrel=1
pkgdesc="Prevent Kubernetes misconfigurations from reaching production (again triumph )! Datree is a CLI tool to ensure K8s manifests and Helm charts follow best practices as well as your organization’s policies."
arch=("x86_64")
url="https://github.com/datreeio/${_pkgname}"
license=("Apache-2.0")
source=("${url}/releases/download/${pkgver}/${_pkgname}-cli_${pkgver}_Linux_x86_64.zip")
sha256sums=("b2cee63e5396eeb55d788a6c2407cd00eed1db80ceab79b70c1346993703e67b")

package() {
  mkdir -p "${pkgdir}/usr/local/bin"
  install -Dm755 "${_pkgname}" "$pkgdir/usr/local/bin/${_pkgname}"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'LICENSE.md' -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

