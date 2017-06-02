# Contributor: levinit <levinit@outlook.com>
# Maintainer: levinit <levinit@outlook.com>
pkgname=adhosts
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="google hosts and blocking ads hosts.用于科学上网和屏蔽广告的hosts."
arch=(any)
url="https://github.com/levinit/adhosts"
license=('GPL')
groups=()
depends=('wget')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/levinit/adhosts/archive/master.zip")
noextract=()
md5sums=('9770ee4c990c8a19f1a7f2b4c5979a12') #use makepkg -g
validpgpkeys=()

package() {
	unzip master.zip
	cd "$pkgname"-master
        ./adhosts
}
