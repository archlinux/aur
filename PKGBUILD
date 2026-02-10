# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Jeff Henson <jeff@henson.io>
# Contributor: Daniel Greve <greve.daniel.l@gmail.com>

pkgname='zsh-pure-prompt'
pkgver=1.27.0
pkgrel=1
pkgdesc='Pretty, minimal and fast ZSH prompt'
arch=('any')
url='https://github.com/sindresorhus/pure'
license=('MIT')
depends=('zsh')
source=("https://github.com/sindresorhus/pure/archive/v${pkgver}.tar.gz")
sha256sums=('2d1594ba329aafd495172754c76ba8fa022b2409c9650a20c11f89edc64470dc')

package() {
    cd pure-"${pkgver}"

    install -Dm644 pure.zsh "${pkgdir}"/usr/share/zsh/functions/Prompts/prompt_pure_setup
    install -Dm644 async.zsh "${pkgdir}"/usr/share/zsh/functions/Prompts/async
    install -Dm644 license "${pkgdir}"/usr/share/licenses/zsh-pure-prompt/license
}
