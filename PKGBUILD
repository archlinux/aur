# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>

pkgname=dedupe-episodes-bin
_pkgname=dedupe-episodes
pkgver=0.1.2
pkgrel=1
arch=('x86_64')
url="https://github.com/asm0dey/dedupe-episodes"
license=('MIT')

pkgdesc='Dedupe TV episodes by quality (resolution + PROPER/REPACK). Keep best, delete worse + sidecars.'

source_x86_64=("$_pkgname-$pkgver-x86_64::https://github.com/asm0dey/$_pkgname/releases/download/v$pkgver/$_pkgname-linux-x86_64")
sha512sums_x86_64=('f4af065dcc146cc403de4650f6f016876afbfc4f2226c91f173042ff84996153de0cccda7d32a2516cb296cd2e845b50e5acf16bab2bb5e8cb274efca4d1385c')
depends=('glibc')
conflicts=("$_pkgname" 'python-dedupe-episodes')
provides=("$_pkgname")

package() {
    install -Dm755 "$srcdir/$_pkgname-$pkgver-x86_64" "$pkgdir/usr/bin/$_pkgname"
}
