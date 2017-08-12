# Maintainer: Aaron Miller <aaronm@cldtk.com>

pkgname=aws-sam-local
pkgver=0.1.0
pkgrel=2
pkgdesc='CLI tool for local development and testing of Serverless applications'
arch=('x86_64' 'i686')
url='https://github.com/awslabs/aws-sam-local'
license=('Apache')
depends=('docker')
source_i686=("https://github.com/awslabs/aws-sam-local/releases/download/v${pkgver}/sam_${pkgver}_linux_386.tar.gz")
source_x86_64=("https://github.com/awslabs/aws-sam-local/releases/download/v${pkgver}/sam_${pkgver}_linux_amd64.tar.gz")
sha256sums_i686=('4a52618a97eb2a28b22e18ee3f51d9c74c611339ee10bab84809433ee4a6911c')
sha256sums_x86_64=('68dca0e5022a855bdab060b9d2729468c1f4aafa0a65f48050dacc5ae41073ce')

package() {
  install -Dm755 sam "${pkgdir}/usr/bin/sam"
}
