# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='cfn-guard'
pkgver=2.0.1
pkgrel=1
pkgdesc='A set of tools to check AWS CloudFormation templates for policy compliance using a simple, policy-as-code, declarative syntax'
url='https://github.com/aws-cloudformation/cloudformation-guard'
license=('Apache')
arch=('x86_64')
depends=('gcc-libs')
conflicts=("cfn-guard-git")
source=("${pkgname}.tar.gz::${url}/releases/download/${pkgver}/${pkgname}-v2-ubuntu-latest.tar.gz")
sha256sums=('7f7b4f694d4ec1bcc26b8964981277b01c6580987be1e069db393eb3f3b2e3b1')

package() {
  install -Dm755 ${srcdir}/cfn-guard-v2-ubuntu-latest/cfn-guard "$pkgdir/usr/bin/cfn-guard"
  install -Dm644 ${srcdir}/cfn-guard-v2-ubuntu-latest/README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
