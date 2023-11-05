# Maintainer:  kxxt <rsworktech at outlook dot com>
_name=tracexec
pkgname="$_name-bin"
pkgver=0.0.3
pkgrel=1
pkgdesc="A small utility for tracing execve{,at}"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/kxxt/tracexec"
license=('MIT')
depends=('gcc-libs')
provides=('tracexec')
conflicts=('tracexec')
backup=()
options=()

source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/kxxt/$_name/releases/download/v$pkgver/$_name-aarch64-unknown-linux-gnu.tar.gz")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/kxxt/$_name/releases/download/v$pkgver/$_name-x86_64-unknown-linux-gnu.tar.gz")
source_riscv64=("$pkgname-$pkgver-riscv64.tar.gz::https://github.com/kxxt/$_name/releases/download/v$pkgver/$_name-riscv64gc-unknown-linux-gnu.tar.gz")
noextract=()
b2sums_x86_64=('a3f4031b643241dec3ecd8efed1993a14091f7d284396e9a2562a6da05175458245c9782661702bec90358fd6a25759eca14e7a0163bdeff0d821cc316cc5428')
b2sums_aarch64=('5d3bc28114d5cc7a27e306035b41b8ae658b6c68a4c12a298d1b78f6a114a99202d821bc37b7b2cde6812915908575898b7b98323d165d21c3e7cc2142c448b3')
b2sums_riscv64=('ab2fe0187098561b0cf057c7476ef71c493abff441aa682487506ea32630decebdeb2d89ec356fa00ef50acab648ed69e9f4d8e0c1363f6e037259f79b513597')


package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "$_name"
}
