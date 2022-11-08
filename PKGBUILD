# Maintainer: Trevor Tilby <trevor dot tilby at gmail dot com>
pkgname='ds3os-loader-rs-bin'
pkgver=0.1.0
pkgrel=1
# epoch=
pkgdesc="Loader for the Dark Souls 3 Open Server"
arch=('x86_64')
url="https://github.com/clague/ds3os-loader-rs"
license=('unknown')
# groups=()
depends=('openssl-1.1' 'fontconfig' 'freetype2' 'gcc-libs' 'glibc'
					'expat' 'zlib' 'bzip2' 'libpng' 'harfbuzz' 'brotli')
# makedepends=()
# checkdepends=()
# optdepends=()
provides=('ds3os-loader')
conflicts=('ds3os-loader')
# replaces=()
# backup=()
# options=()
# install=
# changelog=
source=("ds3os-loader-linux::https://github.com/clague/ds3os-loader-rs/releases/download/v0.1.0-rc1/ds3os-loader-linux")
# noextract=("ds3os-loader-linux")
md5sums=("6fc1b38f4111ffed8c74d05568c54d35")
# validpgpkeys=()

# prepare() {
# 	cd "$pkgname-$pkgver"
# 	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
# }

# build() {
# 	cd "$pkgname-$pkgver"
# 	./configure --prefix=/usr
# 	make
# }

# check() {
# 	cd "$pkgname-$pkgver"
# 	make -k check
# }

package() {
	# cd "$pkgname-$pkgver"
	# make DESTDIR="$pkgdir/" install
# 	install -Dm 755 -t "${pkgdir}/usr/bin/ds3os-loader" "ds3os-loader-linux" 
	install -Dm 755 "ds3os-loader-linux" "${pkgdir}/usr/bin/ds3os-loader"
}
