# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>
pkgname=ollama-bin
pkgver=0.1.9
pkgrel=1
pkgdesc='Get up and running with large language models, locally'
arch=('x86_64')
url='https://ollama.ai/'
license=('MIT')
provides=('ollama-bin')
source=("https://github.com/jmorganca/ollama/releases/download/v${pkgver}/ollama-linux-amd64")
sha256sums=('821124199378ba12a41d40974e24f39657ab6e0fa435d590ce7697eda3ec2c05')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -D -m755 "${srcdir}/ollama-linux-amd64" "${pkgdir}/usr/bin/ollama"
}
