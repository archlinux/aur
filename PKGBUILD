# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>

pkgname=amigashell
_pkgname=AmigaShell
pkgver=2.3
pkgrel=5
pkgdesc='A virtual console looking like a Commodore AmigaOS shell'
arch=('any')
url="https://github.com/mdoege/AmigaShell"
license=('GPL')
depends=('bash' 'kbd')
makedepends=('git')
optdepends=(
  'gpm: mouse-based copy-and-paste for the virtual console'
  'fbv: for extra cuteness when you type "reboot" (source amigashell.env first!)'
)
install=$pkgname.install
source=("git://github.com/mdoege/AmigaShell.git")
md5sums=('SKIP')

package() {
	cd "${srcdir}/${_pkgname}/amigashell-2.3-4-any.pkg"
	cp -a usr "$pkgdir"
}
