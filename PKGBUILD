# Maintainer: Mumulhl <mumulhl.666@gmail.com>
pkgname="helix-gpt-bin"
pkgver=0.34
pkgrel=1
pkgdesc="Code assistant language server for Helix with support for Copilot/OpenAI/Codeium/Ollama"
arch=("x86_64")
url="https://github.com/leona/helix-gpt"
license=("MIT")
provides=("helix-gpt")
conflicts=("helix-gpt")
source=("helix-gpt-${pkgver}.tar.gz::https://github.com/leona/helix-gpt/releases/download/${pkgver}/helix-gpt-${pkgver}-x86_64-linux.tar.gz")
sha256sums=('4e9e2987166842382d6de616a3faa1391be15298f0344cd862b2fc3531dc9e69')
options=(!strip)

package() {
	install -Dm755 "${srcdir}/helix-gpt-${pkgver}-x86_64-linux" "${pkgdir}/usr/bin/helix-gpt"
}
