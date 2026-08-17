# Maintainer: Sisanta Chhatoi <sisantachhatoi40@gmail.com>
  
pkgname=open-code-review-bin
pkgver=1.9.5
pkgrel=1
pkgdesc="Alibaba's open-source AI-powered code review CLI tool"
arch=('x86_64')
url="https://github.com/alibaba/open-code-review"
license=('Apache-2.0')
provides=('ocr' 'open-code-review')
conflicts=('ocr' 'open-code-review')
  
source_x86_64=("${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/opencodereview-linux-amd64")
sha256sums_x86_64=('864cf7e7304e37974c298eded2685ec0fb63a4ac6c518ad4524da718e3e72012')
  
package() {
    cd "${srcdir}"
     
    install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/ocr"
}
