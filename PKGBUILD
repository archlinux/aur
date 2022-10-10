# Maintainer: Eugene Dementyev <e@dementyev.me>

pkgname=pulumictl
pkgver=0.0.32
pkgrel=1
pkgdesc="A swiss army knife for Pulumi development"
arch=('x86_64')
license=('Apache-2.0')
url="https://github.com/pulumi/pulumictl"
source=("https://github.com/pulumi/pulumictl/releases/download/v${pkgver}/pulumictl-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('55aa04ffe122e2686c20563a9d93b1bfcc03dbc57daf90e0a8d17efde966fd20')
package() {
  cd "${srcdir}/"

  install -D -m 755 "$pkgname" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
