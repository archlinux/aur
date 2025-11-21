# Maintainer: OverShifted <prowidgs@gmail.com>
# Contributor: nlsdt <nlsdt@nlsdt.cc>

_pkgname=simple-http-server
pkgname=simple-http-server-bin
pkgver=0.6.13
pkgrel=3
pkgdesc='Simple http server in Rust'
arch=('x86_64' 'aarch64')
url='https://github.com/TheWaWaR/simple-http-server'
license=('MIT')
depends=()
conflicts=('simple-http-server-git' 'simple-http-server')
provides=('simple-http-server-git' 'simple-http-server')
source_x86_64=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/x86_64-unknown-linux-musl-simple-http-server"
               "LICENSE::$url/raw/refs/heads/master/LICENSE")
source_aarch64=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/aarch64-unknown-linux-musl-simple-http-server"
                "LICENSE::$url/raw/refs/heads/master/LICENSE")
sha256sums_x86_64=('08951d8e998d97dc4a35cb9376c888b98fa5dfb3dbf03d2fc96299403fd00422'
                   'cb553bbae0f2d76fb84aef02a9fc572eceea052be4354a11bb53cf482f091845')
sha256sums_aarch64=('faa93db5c108bccf043d1f04f6497a94966042836d4e57996af049706a3d00af'
                    'cb553bbae0f2d76fb84aef02a9fc572eceea052be4354a11bb53cf482f091845')

package() {
	install -Dm755 "$srcdir/$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
