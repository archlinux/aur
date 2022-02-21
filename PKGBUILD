# Maintainer: Nikita Ivanov <nikita dot vyach dot ivanov at gmail dot com>
pkgname=snake-asm
pkgver='0.4'
pkgrel=1
pkgdesc="Terminal-based snake game written in $CARCH assembly"
arch=('x86_64')
url="https://github.com/NikitaIvanovV/snake-asm"
license=('MIT')
depends=()

sha256sums=('c7ba22f90976827e9a7ac55a4c14a3334cd3ddf8529eac60060074088c0543bf' '8da3c7fb991e7569014838efa851200b5aba7a496e72371bcaa2a2450d1316cf')

source=(
    "$url/releases/download/v$pkgver/snake-asm.tar.gz"
    "$url/archive/refs/tags/v$pkgver.tar.gz"
)


package() {
    local prefix="$pkgdir/usr"
    local binprefix="$prefix/bin"
    local licenseprefix="$prefix/share/licenses/$pkgname"

    mkdir -p "$binprefix" "$licenseprefix"

    cp "$srcdir/$pkgname" "$binprefix"
    cp "$srcdir/$pkgname-$pkgver/LICENSE" "$licenseprefix"
}
