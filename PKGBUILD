# Maintainer: Milk Brewster (milk on freenode irc)
pkgname=chipdisco
pkgver=6.1
pkgrel=1
epoch=
pkgdesc="a dual-deck DJ app for tracker modules (.MOD/.XM/.S3M)"
arch=('x86_64')
url="https://echolevel.co.uk/post/1486312636973-Chipdisco"
license=('unknown')
groups=()
depends=('unzip' )
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
source=("https://firebasestorage.googleapis.com/v0/b/echolevel-b069e.appspot.com/o/files%2FChipdisco6.1_Linux.zip?alt=media&token=82d65992-6dc9-4acc-8c05-4b3e0011884d")
noextract=()
md5sums=('SKIP')
validpgpkeys=()
# 
# prepare() {
	# cd "$srcdir/Chipdisco6.1_Linux/  
# }
# 
# build() {
	# cd "$srcdir"
# }
# 
# check() {
	# cd "$pkgname-$pkgver"
	# make -k check
# }
# 
package() {
	cd "$srcdir"
  echo "#!/bin/sh" > chipdisco
  echo "exec /usr/bin/java -jar '/usr/share/java/chipdisco/Chipdisco6.jar' '$@'" >> chipdisco
	install -D -m755 "${srcdir}/chipdisco" "${pkgdir}/usr/bin/chipdisco"
	install -D -m755 "${srcdir}/Chipdisco6.1_Linux/lib/Chipdisco6.jar" "${pkgdir}/usr/share/java/chipdisco/Chipdisco6.jar"
}
