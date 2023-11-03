# Contributor: Asuka Minato
pkgname=rabbit-digger-pro-bin
pkgver=20230131
pkgrel=1
pkgdesc="All-in-one proxy written in Rust"
arch=(x86_64 aarch64 armv7 i686)
url="https://rabbit-digger.com/"
license=('unknown')
depends=(glibc gcc-libs)
provides=(rabbit-digger-pro)
source_x86_64=("https://github.com/rabbit-digger/rabbit-digger-pro/releases/download/${pkgver}/rabbit-digger-pro-linux-amd64")
source_aarch64=("https://github.com/rabbit-digger/rabbit-digger-pro/releases/download/${pkgver}/rabbit-digger-pro-aarch64-unknown-linux-musl")
source_armv7=("https://github.com/rabbit-digger/rabbit-digger-pro/releases/download/${pkgver}/rabbit-digger-pro-armv7-unknown-linux-gnueabihf")
source_i686=("https://github.com/rabbit-digger/rabbit-digger-pro/releases/download/${pkgver}/rabbit-digger-pro-i686-unknown-linux-musl")
sha256sums_x86_64=('5c16b88ea4db8b69278446a3b247cdac995348f85b68a911cb4aa8d3a9894bad')
sha256sums_aarch64=('c734b67382ed872b8bdcfc2592c3dbb3e5df1722c72adc0a74278298e5b51410')
sha256sums_armv7=('bfe9404236cc71f10b12cb9516590645504fba8c386dfd00eaa2b21c15125d4e')
sha256sums_i686=('d1b144e7eceaa31f5e450d64ea6e1fd51160243c7b49128c8043bec82a426e66')

package() {
	find $srcdir \
		-name "rabbit*" \
		-exec install -Dm755 {} $pkgdir/usr/bin/rabbit-digger-pro \;
}
