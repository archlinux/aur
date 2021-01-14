# Maintainer: anekos <anekos@snca.net>
pkgname=aws-lambda-rie
pkgver=1.0
pkgrel=1
pkgdesc="AWS Lambda runtime interface emulator"
url="https://aws.amazon.com/"
arch=('x86_64')
license=('Apache_v2')
source=("https://github.com/aws/aws-lambda-runtime-interface-emulator/releases/download/v${pkgver}/aws-lambda-rie")
md5sums=('33796b3e29d200c0d08b93c67161e87f')

package () {
  cd "$srcdir"
  ls -la

  install -Dm755 aws-lambda-rie "$pkgdir/usr/bin/aws-lambda-rie"
}

# vim:set ts=2 sw=2 et:
