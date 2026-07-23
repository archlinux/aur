# Maintainer: OverShifted <prowidgs@gmail.com>
# Contributor: nlsdt <nlsdt@nlsdt.cc>

_pkgname=simple-http-server
pkgname=simple-http-server-bin
pkgver=0.8.0
pkgrel=2
pkgdesc='Simple http server in Rust'
arch=('x86_64' 'aarch64')
url='https://github.com/TheWaWaR/simple-http-server'
license=('MIT')
options=('!debug')
conflicts=('simple-http-server-git' 'simple-http-server')
provides=('simple-http-server-git' 'simple-http-server')
source_x86_64=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/x86_64-unknown-linux-musl-simple-http-server"
               "LICENSE::$url/raw/refs/heads/master/LICENSE")
source_aarch64=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/aarch64-unknown-linux-musl-simple-http-server"
                "LICENSE::$url/raw/refs/heads/master/LICENSE")
sha256sums_x86_64=('a16d73db4b33edc6aada0bb54088773dba8cb4d02eaa13364559552072d628cd'
                   'cb553bbae0f2d76fb84aef02a9fc572eceea052be4354a11bb53cf482f091845')
sha256sums_aarch64=('88a523d339fa412575e497ee1741ffa4a7b6bdcfa23681a82eac7b8cd2bdf815'
                    'cb553bbae0f2d76fb84aef02a9fc572eceea052be4354a11bb53cf482f091845')

package() {
	install -Dm755 "$srcdir/$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
