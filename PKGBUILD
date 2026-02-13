# Maintainer: Nanaka Hiira <hiira plus archlinux at hiira dot dev>
pkgname=hazkey-zenzai-model
pkgver=0.1
pkgrel=1
pkgdesc="Zenzai system model for Hazkey"
arch=('any')
url="https://huggingface.co/Miwa-Keita/zenz-v3.1-small-gguf"
license=('CC-BY-SA-4.0')
source=("https://huggingface.co/Miwa-Keita/zenz-v3.1-small-gguf/resolve/main/ggml-model-Q5_K_M.gguf")
sha256sums=('4de930c06bef8c263aa1aa40684af206db4ce1b96375b3b8ed0ea508e0b14f6c')

package() {
    install -Dm644 "${srcdir}/ggml-model-Q5_K_M.gguf" "${pkgdir}/usr/share/hazkey/zenzai.gguf"
}
