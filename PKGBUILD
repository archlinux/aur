# Maintainer: Charles Milette <charles.milette@gmail.com>

_gitname=eminence
pkgname=enlightenment-${_gitname}-theme-bin
pkgver=0.1.10
pkgrel=1
pkgdesc="Purple/Violet Dark Theme for Enlightenment and Terminology"
arch=('any')
url="https://github.com/Obsidian-StudiosInc/${_gitname}"
license=('GPL3')
source=("https://github.com/Obsidian-StudiosInc/${_gitname}/releases/download/v${pkgver}/eminence-elementary.edj" "https://github.com/Obsidian-StudiosInc/${_gitname}/releases/download/v{$pkgver}/eminence-terminology.edj")
md5sums=('9ae1099a991b089527a56dc845c79450' '5ce4630747160f677c9bed11ba853f70')

package() {
	install -Dm644 "${srcdir}/eminence-elementary.edj" "$pkgdir"/usr/share/elementary/themes/eminence.edj
	install -Dm644 "${srcdir}/eminence-terminology.edj" "$pkgdir"/usr/share/terminology/themes/eminence.edj
}									