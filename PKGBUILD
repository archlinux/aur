# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='cfn-guard'
pkgver=2.0.4
pkgrel=1
pkgdesc='A set of tools to check AWS CloudFormation templates for policy compliance using a simple, policy-as-code, declarative syntax'
url='https://github.com/aws-cloudformation/cloudformation-guard'
license=('Apache')
arch=('x86_64')
depends=('gcc-libs')
conflicts=("cfn-guard-git")
source=("${pkgname}.tar.gz::${url}/releases/download/${pkgver}/${pkgname}-v2-ubuntu-latest.tar.gz")
sha256sums=('6c0b737e0564a62554be065a3a05609a187720ce5ff3e32db9eec8eb6aa99372')

package() {
  install -Dm755 ${srcdir}/cfn-guard-v2-ubuntu-latest/cfn-guard "$pkgdir/usr/bin/cfn-guard"
  install -Dm644 ${srcdir}/cfn-guard-v2-ubuntu-latest/README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
