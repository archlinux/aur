pkgname=luna-llm
pkgver=1.0.0
pkgrel=1
pkgdesc="Arunachalam's Luna-2.5B: A specialized tool for the Arch Linux community. Developed by a 7-year veteran builder based in Tamil Nadu, India."
arch=('any')
url="https://github.com/Arunachalam-gojosaturo/Luna-2.5B-LLM"
license=('Apache')
depends=('ollama')
source=("luna-llm")
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/luna-llm" "${pkgdir}/usr/bin/luna-llm"
}
