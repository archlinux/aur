# Maintainer: 4679kun <4679kun@outlook.com>
# Maintainer: meepzh <meep.aur@meepzh.com>

pkgname=minify
pkgver=2.5.0
pkgrel=1
pkgdesc="Minifier CLI for HTML, CSS, JS, JSON, SVG and XML"
arch=('x86_64')
url="https://github.com/tdewolff/minify"
license=('MIT')
depends=('glibc')
optdepends=('bash-completion: command-line autocomplete with bash')
source=("https://github.com/tdewolff/minify/releases/download/v${pkgver}/minify_${pkgver}_linux_amd64.tar.gz"
        "https://raw.githubusercontent.com/tdewolff/minify/master/cmd/minify/minify_bash_tab_completion")
sha256sums=('a1215b0a29f78a19cef6824671bb6da606a19442fd4225b3ec62ed62125f6ecc'
            '25f25a205ca071471daab6b1c8eeb16e0b1c8609844b158b85c76344eb4bbc31')

package() {
  install -D -m755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 "minify_bash_tab_completion" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
}

