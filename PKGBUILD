# Maintainer: Eugene Dementyev <e@dementyev.me>

pkgname=pulumictl
pkgver=0.0.45
pkgrel=1
pkgdesc="A swiss army knife for Pulumi development"
arch=('x86_64')
license=('Apache-2.0')
url="https://github.com/pulumi/pulumictl"
source=("https://github.com/pulumi/pulumictl/releases/download/v${pkgver}/pulumictl-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('9ffa426ae650dce8b38fd42828b7e4a62620ced48ac8d2d650296ace4aa112d1')
package() {
  cd "${srcdir}/"

  install -D -m 755 "$pkgname" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
