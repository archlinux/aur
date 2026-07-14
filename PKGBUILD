# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Jeff Henson <jeff@henson.io>
# Contributor: Daniel Greve <greve.daniel.l@gmail.com>

pkgname=zsh-pure-prompt
pkgver=1.28.2
pkgrel=1
pkgdesc='Pretty, minimal and fast ZSH prompt'
arch=('any')
url='https://github.com/sindresorhus/pure'
license=('MIT')
depends=('zsh')
source=("https://github.com/sindresorhus/pure/archive/v${pkgver}.tar.gz")
b2sums=('8cdde8e1afbd3fb93906e71464fa3d2dce8e3cba00b5ddb874fe84f1b5975ce625ef57cb5ceda0d104b66b749600642cfe051cb6c9f90876eea4c93070b56d6e')

package() {
    cd pure-"${pkgver}"

    install -Dm644 async.zsh "${pkgdir}"/usr/share/zsh/functions/Prompts/async
    install -Dm644 pure.zsh "${pkgdir}"/usr/share/zsh/functions/Prompts/prompt_pure_setup

    install -Dm644 license "${pkgdir}"/usr/share/licenses/zsh-pure-prompt/license
}
