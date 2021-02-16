# Maintainer: aksel <aksel@akseltorgard.com>

pkgname=aws-sam-cli-bin
pkgver=1.18.1
pkgrel=1
pkgdesc='CLI tool to build, test, debug, and deploy Serverless applications using AWS SAM'
arch=('any')
url='https://github.com/awslabs/aws-sam-cli'
license=('Apache')
optdepends=('docker')
source=("https://github.com/aws/aws-sam-cli/releases/download/v$pkgver/aws-sam-cli-linux-x86_64.zip")
sha256sums=('742ea69de70100b132cd636612d5d256e628178f366284bf74defef656969968')
provides=("aws-sam-cli")
conflicts=("aws-sam-cli")

package() {
  cd "$srcdir"

  ./install --install-dir "$pkgdir/usr/local/aws-sam-cli" --bin-dir "$pkgdir/usr/local/bin"
}
