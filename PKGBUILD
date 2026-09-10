# Maintainer: Martan03 <martinslezak03@gmail.com>
pkgname=mdcon-bin
_pkgname=mdcon
pkgver=0.1.0
pkgrel=1
pkgdesc="Utility for generating Table of Contents from Markdown file."
arch=('x86_64')
url="https://github.com/Martan03/mdcon"
license=('GPL3')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("https://github.com/Martan03/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('9343d4ac5def3098e83d4bfdc26a445c77d48f0246ace81abc0a24e9a11c3d45')

package() {
    cd "$srcdir/$_pkgname-v$pkgver-${CARCH}-unknown-linux-musl"
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
