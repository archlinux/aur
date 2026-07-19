# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Jeff Henson <jeff@henson.io>
# Contributor: Daniel Greve <greve.daniel.l@gmail.com>

pkgname=zsh-pure-prompt
pkgver=1.28.3
pkgrel=1
pkgdesc='Pretty, minimal and fast ZSH prompt'
arch=('any')
url='https://github.com/sindresorhus/pure'
license=('MIT')
depends=('zsh')
source=("https://github.com/sindresorhus/pure/archive/v${pkgver}.tar.gz")
b2sums=('5577a87ba2662ddbc0674db9f3ee4f6bcbeb5a848caf507936b16cee10837baf68e05a9525476cc5dd19883ca9bf5a4eef4edd2745f9e3679bef8535799cc65a')

package() {
    cd pure-"${pkgver}"

    install -Dm644 async.zsh "${pkgdir}"/usr/share/zsh/functions/Prompts/async
    install -Dm644 pure.zsh "${pkgdir}"/usr/share/zsh/functions/Prompts/prompt_pure_setup

    install -Dm644 license "${pkgdir}"/usr/share/licenses/zsh-pure-prompt/license
}
