# Maintainer: Aaron Miller <aaronm@cldtk.com>

pkgname=aws-sam-local
pkgver=0.2.0
pkgrel=1
pkgdesc='CLI tool for local development and testing of Serverless applications'
arch=('x86_64' 'i686')
url='https://github.com/awslabs/aws-sam-local'
license=('Apache')
depends=('docker')
source_i686=("https://github.com/awslabs/aws-sam-local/releases/download/v${pkgver}/sam_${pkgver}_linux_386.tar.gz")
source_x86_64=("https://github.com/awslabs/aws-sam-local/releases/download/v${pkgver}/sam_${pkgver}_linux_amd64.tar.gz")
sha256sums_i686=('0e10b2951a093cbe6d3c3582f22b4218958b13ff29e06e2217fc79d94d96aa96')
sha256sums_x86_64=('8a1fb9880fe19eff84f63ba604ac8ec05a12affadce7a261d8b3013f0c4e91ab')

package() {
  install -Dm755 sam "${pkgdir}/usr/bin/sam"
}
