
pkgname='nemo-copypath'
pkgdesc='Adds an option to copy the full path of the selected file to the nemo context menu'
pkgver='1.0'
pkgrel='1'
arch=('x86_64')
url='https://github.com/username227/nemo-copy-path'
license=('GPL3')
depends=('nemo' 'diodon' 'xclip' 'nodejs')
makedepends=('git' 'npm')
source=(git+"https://github.com/username227/nemo-copy-path#tag=1.0")
sha256sums=('aa101bc71e6573f80256749d9b0f2df17dfa42943876c7ac06b4440348d9848d')
install=copypath.install
prepare() {
	npm install copy-paste
}
package() {
	install -Dm644 $srcdir/nemo-copy-path/copypath.nemo_action -t $pkgdir/$HOME/.local/share/nemo/actions
}
