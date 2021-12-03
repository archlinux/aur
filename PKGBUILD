# Maintainer: sioodmy <a.sokolowski06@gmail.com>
pkgname=todo-bin
pkgver=2.4
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

sha512sums=('f6825f3e775eda22171ad67c75a9547aeced2c66f8d3d6c269c92bcd1e4b46a6eb770e7b6391dbae26f67a485a7033a2e9d57db0faee52f1dfb6a3c5a6772245'
	'd361e5e8201481c6346ee6a886592c51265112be550d5224f1a7a6e116255c2f1ab8788df579d9b8372ed7bfd19bac4b6e70e00b472642966ab5b319b99a2686')
