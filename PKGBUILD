# Maintainer: Sisanta Chhatoi <sisantachhatoi40@gmail.com>
  
pkgname=open-code-review-bin
pkgver=1.7.13
pkgrel=1
pkgdesc="Alibaba's open-source AI-powered code review CLI tool"
arch=('x86_64')
url="https://github.com/alibaba/open-code-review"
license=('Apache-2.0')
provides=('ocr' 'open-code-review')
conflicts=('ocr' 'open-code-review')
  
source_x86_64=("${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/opencodereview-linux-amd64")
sha256sums_x86_64=('4f0d8cf68b59c7e3573fa8312779401aa48ee498733fb59245eb664791a09c20')
  
package() {
    cd "${srcdir}"
     
    install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/ocr"
}
