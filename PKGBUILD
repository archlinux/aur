# Maintainer: Aaron Miller <aaronm@cldtk.com>

pkgname=aws-sam-local
pkgver=0.2.4
pkgrel=1
pkgdesc='CLI tool for local development and testing of Serverless applications'
arch=('x86_64' 'i686')
url='https://github.com/awslabs/aws-sam-local'
license=('Apache')
depends=('docker')
source_i686=("https://github.com/awslabs/aws-sam-local/releases/download/v${pkgver}/sam_${pkgver}_linux_386.tar.gz")
source_x86_64=("https://github.com/awslabs/aws-sam-local/releases/download/v${pkgver}/sam_${pkgver}_linux_amd64.tar.gz")
sha256sums_i686=('c05df2dd3920a84b512289066107862c680119ad975131372e52d6da3a054e83')
sha256sums_x86_64=('b3b7fadd473f3098c1373d52929df7c20f8a8fb75ea641890eeca03356161719')

package() {
  install -Dm755 sam "${pkgdir}/usr/bin/sam"
}
