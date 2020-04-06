# Maintainer: Fabio Sussarellu <sussarellu.fabio@gmail.com>
executableName=bashtop
pkgname=$executableName-git
pkgver=master
pkgrel=1
pkgdesc='Resource monitor that shows usage and stats for processor, memory, disks, network and processes.'
arch=('any')
url='https://github.com/aristocratos/bashtop'
license=('APACHE')
depends=('bash')
source=("https://github.com/aristocratos/$executableName/raw/$pkgver/$executableName")
md5sums=('811c863be968c4c81579261f1a4868a9')

package() {
	cd "$srcdir"
	chmod +x "$executableName"
	mkdir -p "$pkgdir"/usr/bin
	install $executableName "$pkgdir"/usr/bin/$executableName
}
