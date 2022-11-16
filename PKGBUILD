# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='cfn-guard'
pkgver=2.1.3
pkgrel=1
pkgdesc='A set of tools to check AWS CloudFormation templates for policy compliance using a simple, policy-as-code, declarative syntax'
url='https://github.com/aws-cloudformation/cloudformation-guard'
license=('Apache')
arch=('x86_64')
depends=('gcc-libs')
conflicts=("cfn-guard-git")
source=("${url}/releases/download/${pkgver}/${pkgname}-v2-ubuntu-latest.tar.gz")
sha256sums=('d3e0463905f86cba7f3e27dbacb2af98bce0995c8955d65b2257a023662d9c8d')

package() {
  install -Dm755 ${srcdir}/cfn-guard-v2-ubuntu-latest/cfn-guard "$pkgdir/usr/bin/cfn-guard"
  install -Dm644 ${srcdir}/cfn-guard-v2-ubuntu-latest/README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
