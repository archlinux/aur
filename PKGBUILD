# Maintainer: ChacaS0 <incoming+chacas0-chksum-13830438-issue-@incoming.gitlab.com>
pkgname=chksum-bin
pkgver=0.1.20
pkgrel=1
pkgdesc="Check and compare easily the checksum of a file."
arch=('x86_64')
url="https://gitlab.com/ChacaS0/chksum"
license=('Apache License 2.0')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("https://gitlab.com/chacas0/chksum/-/jobs/artifacts/master/download?job=build")
noextract=('artifacts.zip')
sha256sums=('SKIP')

prepare() {
	echo "[PREPARE]  STATUS : Ready."
}

build() {
	echo "[BUILD]    STATUS : Ready."
	echo "[BUILD]    INFO   : Already built."
}

package () {
	echo "[INSTALL]  STATUS : Started."
	echo "[INSTALL]  INFO   : Putting chksum into /usr/bin..."
	echo "[INSTALL]  INFO   : "
	sudo install "${srcdir}/chksum" /usr/bin
	ls -lh /usr/bin | grep chksum
	echo "[INSTALL]  STATUS : Done."
}

pre_remove() {
	rm -rfv /usr/bin/chksum
}

# see https://wiki.parabola.nu/Creating_Packages#The_package.28.29_function
