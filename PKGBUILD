# Maintainer: Sisanta Chhatoi <sisantachhatoi40@gmail.com>
  
pkgname=open-code-review-bin
pkgver=1.6.5
pkgrel=1
pkgdesc="Alibaba's open-source AI-powered code review CLI tool"
arch=('x86_64')
url="https://github.com/alibaba/open-code-review"
license=('Apache-2.0')
provides=('ocr' 'open-code-review')
conflicts=('ocr' 'open-code-review')
  
source_x86_64=("${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/opencodereview-linux-amd64")
sha256sums_x86_64=('f0b88afad7ef0b0bd86251b00ff311bcc9ab35ebbe01ae89aebaceb7c4c92982')
  
package() {
    cd "${srcdir}"
     
    install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/ocr"
}
