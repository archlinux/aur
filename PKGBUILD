# Maintainer: Sakura1943 <1436700265@qq.com>
pkgname=rhythm-doctor
pkgver=1.1
pkgrel=1
pkgdesc="Rhythm Doctor by deepin-wine5"
arch=(x86_64)
url="https://gitlab.com/Sakura1943/rhychm-doctor"
license=('GPL')
depends=('deepin-wine5' 'deepin-wine5-helper')
provides=(rhythmdoctor=$pkgver)
replaces=()
backup=()
options=()
install=
changelog=
source=("https://gitlab.com/Sakura1943/rhychm-doctor/-/raw/master/rhythmdoctor.tar.gz")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

prepare() {
	mkdir "$pkgname-$pkgver"
	cp -r opt "$pkgname-$pkgver"/opt
	cp -r usr "$pkgname-$pkgver"/usr
}

#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}

package() {
	cd "$pkgname-$pkgver"
    cp -r opt ${pkgdir}
    cp -r usr ${pkgdir}
}
