# Maintainer: Aaron Miller <aaronm@cldtk.com>

pkgname=aws-sam-local
pkgver=0.2.11
pkgrel=1
pkgdesc='CLI tool for local development and testing of Serverless applications'
arch=('x86_64' 'i686')
url='https://github.com/awslabs/aws-sam-local'
license=('Apache')
depends=('docker')
source_i686=("https://github.com/awslabs/aws-sam-local/releases/download/v${pkgver}/sam_${pkgver}_linux_386.tar.gz")
source_x86_64=("https://github.com/awslabs/aws-sam-local/releases/download/v${pkgver}/sam_${pkgver}_linux_amd64.tar.gz")
sha256sums_i686=('c14b0d9181d97ed17f1db1372b62e703f03def821f880f71ebc37f5c0de84029')
sha256sums_x86_64=('e4002dc44659e9a4acf0689828da90f0d3d644efa118c79eec6b0d6135802109')

package() {
  install -Dm755 sam "${pkgdir}/usr/bin/sam"
}
