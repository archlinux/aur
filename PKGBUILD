# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=xscreenshot
pkgver=3.1
pkgrel=1
pkgdesc='A tool for capture, edit, share and exchange screenshots between people via the internet'
arch=('i686' 'x86_64')
url='http://xscreenshot.com/'
license=('custom:xscreenshot')
groups=()
depends=(gcc-libs libxext libxrender fontconfig)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install='xscreenshot.install'
source=("http://xscreenshot.com/downloads/$pkgname-linux-i386.tar.gz"
LICENSE
xscreenshot.desktop
)
noextract=()

build(){
  cd "$srcdir"
  if which chrpath &>/dev/null; then
    chrpath -d $pkgname
  fi
  install -Dm755 LICENSE $pkgdir/usr/share/licenses/custom/$pkgname/LICENSE
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}
md5sums=('2A5296336572F702C38BAA0314FFD0DA'
         'd03f35823a7b68b7663750f7d063ce5b'
         'fae75179ffcb2a7d0757ddfb69ea9095')
