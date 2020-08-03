# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: cyrant <cyrant at tuta dot io>

pkgname=scenarist-bin
pkgver=0.7.2.rc9i
pkgrel=1
pkgdesc='A professional screenwriting software.'
url='https://kitscenarist.ru/en/'
arch=('x86_64')
license=('GPL3')
conflicts=('scenarist')
depends=()
source=("https://kitscenarist.ru/downloads/linux/scenarist-setup-${pkgver}_amd64.deb")
sha512sums=('2c3424952a1e6d072f1423c228f2bce1fd6b122c380a995c7c951a24a4541a935c87126319da43ede7ccc72ad07d18c8e57234e364b8cb87116a5109dc167d13')
options=('!strip' '!emptydirs')
PKGEXT=.tar

package() {
  tar xf data.tar.xz -C "${pkgdir}"
  chmod go-w -R "${pkgdir}"
}
