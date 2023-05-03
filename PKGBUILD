# Maintainer: Max <200706max at gmail dot com>
pkgname=open-gpt-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Free ChatGpt cli!"
arch=(x86_64)
license=('custom')
url="https://sourceforge.net/projects/open-gpt/" 
source=("https://downloads.sourceforge.net/sourceforge/open-gpt/open-gpt.tar.gz")
sha512sums=('SKIP')

depends=('qt6-base')

package() {
  tar -xzf "${srcdir}/open-gpt.tar.gz" -C "${srcdir}"
  install -Dm755 "${srcdir}/OpenGPT" "${pkgdir}/usr/bin/OpenGPT"
}
