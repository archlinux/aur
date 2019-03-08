# Maintainer: Charles Milette <charles.milette@gmail.com>

_gitname=eminence
pkgname=enlightenment-${_gitname}-theme-bin
pkgver=0.1.13
pkgrel=1
pkgdesc="Purple/Violet Dark Theme for Enlightenment and Terminology"
arch=('any')
url="https://github.com/Obsidian-StudiosInc/${_gitname}"
license=('GPL3')
source=("https://github.com/Obsidian-StudiosInc/${_gitname}/releases/download/v${pkgver}/eminence-elementary.edj" "https://github.com/Obsidian-StudiosInc/${_gitname}/releases/download/v${pkgver}/eminence-terminology.edj")
md5sums=('a7784ae1bd3ec9102a2c3112dd9684e5'
         '7470807e0f8963e86155f7c8b1d2580b')

package() {
	install -Dm644 "${srcdir}/eminence-elementary.edj" "$pkgdir"/usr/share/elementary/themes/eminence.edj
	install -Dm644 "${srcdir}/eminence-terminology.edj" "$pkgdir"/usr/share/terminology/themes/eminence.edj
}
