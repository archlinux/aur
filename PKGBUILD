# Maintainer: Eugene Dementyev <e@dementyev.me>

pkgname=pulumictl
pkgver=0.0.25
pkgrel=2
pkgdesc="A swiss army knife for Pulumi development"
arch=('x86_64')
license=('Apache-2.0')
url="https://github.com/pulumi/pulumictl"
source=("https://github.com/pulumi/pulumictl/releases/download/v${pkgver}/pulumictl-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('27a428cd27ef0469d56a74ffd456658b3f82424be1a295e530d6953825954c25')
package() {
  cd "${srcdir}/"

  install -D -m 755 "$pkgname" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
