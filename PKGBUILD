# Maintainer: tdewolff <tacodewolff@gmail.com>
# Maintainer: 4679kun <4679kun@outlook.com>
# Maintainer: meepzh <meep.aur@meepzh.com>

pkgname=minify
pkgver=2.6.1
pkgrel=1
pkgdesc="Minifier CLI for HTML, CSS, JS, JSON, SVG and XML"
arch=('x86_64')
url="https://github.com/tdewolff/minify"
license=('MIT')
optdepends=('bash-completion: command-line autocomplete with bash')
source=("https://github.com/tdewolff/minify/releases/download/v${pkgver}/minify_${pkgver}_linux_amd64.tar.gz"
        "https://raw.githubusercontent.com/tdewolff/minify/master/cmd/minify/minify_bash_tab_completion")
sha256sums=('e936a81d5fa8f44907298116f8bca9c4c3dca0d51c055ae0f97d43b67cafacda'
            '2410022ab77254225eb11ac34f4ee473aaa0d8add7d868e2a22af5964f89f1cf')

package() {
  install -D -m755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 "minify_bash_tab_completion" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
}

