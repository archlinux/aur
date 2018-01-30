# Maintainer: Aaron Miller <aaronm@cldtk.com>

pkgname=aws-sam-local
pkgver=0.2.6
pkgrel=1
pkgdesc='CLI tool for local development and testing of Serverless applications'
arch=('x86_64' 'i686')
url='https://github.com/awslabs/aws-sam-local'
license=('Apache')
depends=('docker')
source_i686=("https://github.com/awslabs/aws-sam-local/releases/download/v${pkgver}/sam_${pkgver}_linux_386.tar.gz")
source_x86_64=("https://github.com/awslabs/aws-sam-local/releases/download/v${pkgver}/sam_${pkgver}_linux_amd64.tar.gz")
sha256sums_i686=('a770dd31ac1565ff53fec62ea2f54c8115d561c3ddd81214536eff1241de17d0')
sha256sums_x86_64=('87afc7f351d9c9f9173d058ddfc94791f9323b75d23e945629ddf47b4a781864')

package() {
  install -Dm755 sam "${pkgdir}/usr/bin/sam"
}
