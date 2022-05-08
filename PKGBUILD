# Maintainer: Nikita Ivanov <nikita dot vyach dot ivanov at gmail dot com>
pkgname=snake-asm
pkgver='0.4.1'
pkgrel=2
pkgdesc="Terminal-based snake game written in $CARCH assembly"
arch=('x86_64')
url="https://github.com/NikitaIvanovV/snake-asm"
license=('MIT')
depends=()

sha256sums=('ef5ace03e40c69247e15188a876acbfdf58389b86e522fe2734d69cb9bb01c9e'
            'f1d4c098913db2c363c5b924f45f0a94118fa6fde511c3c8473ebd89f0200aa8')

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
