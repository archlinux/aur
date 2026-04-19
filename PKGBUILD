# Maintainer:  aik2 <code at lejun dot site>

pkgname=chuckfmt-bin
_name=chuckfmt
pkgver=0.2.2
pkgrel=1
pkgdesc='A fast code formatter => ChucK programming language'
arch=('x86_64' 'aarch64')
url='https://github.com/aik2mlj/chuckfmt'
license=('MIT')
depends=('clang')
provides=($_name)
conflicts=($_name)

source_x86_64=("$url/releases/download/v$pkgver/$_name-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/$_name-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('f38cff90502ed7c5518d23c3cc3bbcc3e66df4f91bf5c43c6c214c5d43dfed91')
sha256sums_aarch64=('d5d39a9cc8018dc8f6972df1e51eca8d4a509dd45c699ba2307fa6e3fe1fe9c0')

package() {
    # install binary
    install -Dm755 "$_name" "$pkgdir/usr/bin/$_name"
}
