# Maintainer: pakrohk <pakrohk@gmail.com>
pkgname=ollaman-bin
pkgver=2.9.1
pkgrel=1
pkgdesc="A modern desktop GUI for managing and interacting with Ollama AI models"
arch=('x86_64')
url="https://ollaman.com"
license=('proprietary')
depends=(
  'gtk3'
  'libnotify'
  'libxss'
  'libxtst'
  'nss'
  'libxcomposite'
  'libxdamage'
  'libxrandr'
  'libgbm'
  'libasound'
  'libxshmfence'
)
source=("https://dl.ollaman.com/updates/v${pkgver}/linux/x86_64/OllaMan_${pkgver}_amd64.deb")
sha256sums=('SKIP')  # بعداً عوض کن

package() {
  cd "$srcdir"
  ar x "OllaMan_${pkgver}_amd64.deb"
  tar -xf data.tar.* -C "$pkgdir"
}
