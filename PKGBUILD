# Maintainer: Max <200706max@gmail.com>
pkgname=open-gpt-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="ChatGpt client using openai api!"
arch=(x86_64)
license=('custom')
url="https://github.com/BeanDx/open-gpt/tree/main" 
source=("https://downloads.sourceforge.net/sourceforge/open-gpt/open-gpt.tar.gz")
sha512sums=('SKIP')

depends=('qt6-base' 'sqlite')

package() {
  tar -xzf "${srcdir}/open-gpt.tar.gz" -C "${srcdir}"
  install -Dm755 "${srcdir}/OpenGPT" "${pkgdir}/usr/bin/OpenGPT"
}
