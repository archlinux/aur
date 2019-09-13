# Maintainer: ChacaS0 <incoming+chacas0-chksum-13830438-issue-@incoming.gitlab.com>
pkgname=chksum
pkgver=0.1
pkgrel=1
pkgdesc="Check and compare easily the checksum of a file."
arch=('x86_64')
url="https://gitlab.com/ChacaS0/chksum"
license=('Apache License 2.0')
groups=()
depends=()
makedepends=('unzip')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("https://gitlab.com/chacas0/chksum/-/jobs/artifacts/master/download?job=build")
noextract=('archives.zip')
sha256sums=('e3e020d4235cea52d43fe8bd2b2d111ae38f160278525e0d140b1cb57374617d')

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
  unzip "$pkdir/chksum" -d /usr/bin
	echo "[INSTALL]  INFO   : "
  ls -lh /usr/bin | grep chksum
	echo "[INSTALL]  STATUS : Done."
}
