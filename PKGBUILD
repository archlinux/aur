# Maintainer: Peter Taylot <info at emersont1 dot co dot uk>

pkgname=robco-terminal-git
pkgver=0.0.0
pkgrel=1
pkgdesc=""
arch=('any')
license=('MIT')
depends=('mkinitcpio-colors-git' 'setcolors-git')
makedepends=('git' 'mkinitcpio-colors-git' 'setcolors-git') # 'bzr', 'git', 'mercurial' or 'subversion'
optdepends=('tilix: installs robco theme to the terminal')
source=('robco-terminal-git::git+https://github.com/emersont1/robco-terminal#branch=master')
md5sums=('SKIP')
install=robco-terminal.install
#backup=('etc/vconsole.conf' 'etc/profile' 'etc/mkinitcpio.conf')
# template start; name=perl-module; version=1.0;

build() {
# don't think i need to do anything
echo $PWD
}

#check() {
#	cd "$srcdir/${pkgname%-VCS}"
#	make -k check
#}

package() {
  echo $PWD
  echo $pkgdir
  ls -R .
  mkdir -p $pkgdir/usr/share/robco/
  mkdir -p $pkgdir/usr/share/tilix/schemes
  cp robco-terminal-git/robco_header.sh $pkgdir/usr/share/robco/robco_shell.sh
  cp robco-terminal-git/setcolors-template $pkgdir/usr/share/robco/setcolors-template
  cp robco-terminal-git/issue $pkgdir/usr/share/robco/issue
  cp robco-terminal-git/terminal-themes/tilix.json $pkgdir/usr/share/tilix/schemes/robco-fallout.json
#	cd "$srcdir/${pkgname%-VCS}"
#	make DESTDIR="$pkgdir/" install
}
