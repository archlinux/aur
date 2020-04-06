# Maintainer: Fabio Sussarellu <sussarellu.fabio@gmail.com>
executableName=bashtop
tree=ca8023960b2f9aa483a6d1c9419191162b3f7a97
pkgname=bashtop-git
pkgver=0.6.5_$tree
pkgrel=1
pkgdesc='Resource monitor that shows usage and stats for processor, memory, disks, network and processes.'
arch=('any')
url='https://github.com/aristocratos/bashtop'
license=('APACHE')
depends=('bash')
source=("https://github.com/aristocratos/$executableName/raw/$tree/$executableName")
md5sums=('811c863be968c4c81579261f1a4868a9')

package() {
	cd "$srcdir"
	chmod +x "$executableName"
	mkdir -p "$pkgdir"/usr/bin
	install $executableName "$pkgdir"/usr/bin/$executableName
}
