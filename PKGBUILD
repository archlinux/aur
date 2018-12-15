# Maintainer: Marcel Campello <tucho@prafrentex.com.br>
pkgname=leiningen-completions
pkgver=2.8.3
pkgrel=1
pkgdesc="Completion scripts for leiningen"
arch=('any')
url="http://github.com/technomancy/leiningen"
license=("EPL")

source=("https://raw.github.com/technomancy/leiningen/${pkgver}/zsh_completion.zsh"
        "https://raw.github.com/technomancy/leiningen/${pkgver}/bash_completion.bash")
sha256sums=('e2913558ec78bf97dc087087a95bd5c9d9a6254496d8b70c1d982baa6d808b5e'
            '15011e79f91eac7d8b5758582aa24bcdec6ee8d1d28c80db3f9ecf6f6220a8a3')

package() {
  cd ${srcdir}
  install -m 0644 -D "${srcdir}"/zsh_completion.zsh "${pkgdir}"/usr/share/zsh/site-functions/_lein
  install -m 0644 -D "${srcdir}"/bash_completion.bash "${pkgdir}"/usr/share/bash-completion/completions/lein
}
