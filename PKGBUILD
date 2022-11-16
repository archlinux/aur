# Maintainer: Castor <whoisyoges at castorisdead dot xyz>
pkgname=local-arch-wiki
pkgver=1.0
pkgrel=0
pkgdesc="An offline version of arch linux wiki."
arch=('any')
url="https://github.com/whoisyoges/local-arch-wiki"
license=('GPL2')
depends=('arch-wiki-docs' 'dmenu' 'bash' 'sed')
optdepends=('rofi' 'firefox' 'xdg-utils' 'notify-send')
makedepends=('git')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/$pkgname"
  chmod +x local-arch-wiki
	install -Dm755 local-arch-wiki "${pkgdir}/usr/local/bin/local-arch-wiki"
}
