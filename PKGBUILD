# Maintainer: sioodmy <a.sokolowski06@gmail.com>
pkgname=todo-bin
pkgver=2.1
pkgrel=1
pkgdesc="Super fast and simple tasks organizer written in rust"
url="https://github.com/sioodmy/todo"
license=('GPL')
conflicts=('todo-git')
depends=()
makedepends=()
arch=("x86_64")
source=("https://github.com/sioodmy/todo/releases/download/${pkgver}/todo"
		"https://raw.githubusercontent.com/sioodmy/todo/master/LICENSE")

package() {
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}

	install -Dm 755 ${srcdir}/todo ${pkgdir}/usr/bin/todo
	install -Dm 644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('322597f26532c9cdea44995c86053a56731a0aa0f05f98d3771d2e2401ffffccee91a4be80ebb5efa3ad7818495973014442fc4368512eee3fa3ea0d6e649454'
	'd361e5e8201481c6346ee6a886592c51265112be550d5224f1a7a6e116255c2f1ab8788df579d9b8372ed7bfd19bac4b6e70e00b472642966ab5b319b99a2686')
