# Maintainer: tkirishima <tkirishima@proton.me>
pkgname=langfetch
pkgver=0.0.1
pkgrel=1
pkgdesc="A command-line tool to display the version of languages on your system"
arch=("any")
url="https://github.com/aderepas/langfetch"
license=('MIT')
depends=(
    'python>=3.10'
)

source=(
  "main.py"
  "languages.json"
)
sha256sums=( '96b5050b69b27826dd5d426db69e471742373c0d28a20fe4b95a0ea822c423bd' '7f9d761e573af1a67e0fdd8c341f360295c234e3f2142215e78d3cd5d31560fc' )

package() {
  install -Dm755 main.py "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 languages.json "${pkgdir}/usr/share/${pkgname}/languages.json"
}

