# Maintainer: Yakumo Saki <yakumo at ziomatrix dot org>
pkgname=lambroll-bin
pkgver=0.11.6
pkgrel=1
epoch=
pkgdesc="Minimal deployment tool for AWS Lambda."
arch=("x86_64")
url="https://github.com/fujiwara/lambroll"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=(aws-cli)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/fujiwara/lambroll/releases/download/v${pkgver}/lambroll_v${pkgver}_linux_amd64.tar.gz")
noextract=()
md5sums=("e78d065124eb3ea208f0239e5f6509b0")
validpgpkeys=()

package() {
	_real_pkgname=lambroll
	cd $srcdir/${_real_pkgname}_v${pkgver}_linux_amd64
	mkdir -p $pkgdir/usr/bin
	cp lambroll $pkgdir/usr/bin
	chmod +x $pkgdir/usr/bin/lambroll
	install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
