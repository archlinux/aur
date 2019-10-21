# Maintainer: William Snyders <iam2391212@gmail.com>

pkgname=aws-okta-bin
pkgdesc="Log into AWS with Okta"
pkgver=0.26.0
pkgrel=1
arch=('x86_64')
url="http://kubernetes.io"
license=('MIT')
provides=('aws-okta=$pkgver')
_aws_okta_bin=aws-okta-v$pkgver-linux-amd64
source_x86_64=($_aws_okta_bin::https://github.com/segmentio/aws-okta/releases/download/v$pkgver/aws-okta-v$pkgver-linux-amd64)
sha256sums_x86_64=('2fa36533eff9c2abcaaf96f549884f56c3966e6964c445cc61a16e49f297dfa5')

package() {
  install -Dm 755 "$srcdir/$_aws_okta_bin" "$pkgdir/usr/bin/aws-okta"
}
