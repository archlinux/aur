# Maintainer:  kxxt <rsworktech at outlook dot com>
_name=tracexec
pkgname="$_name-bin"
pkgver=0.0.4
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
b2sums_x86_64=('9e8b0cdacf1f0bc5d35b54a965150ef13dc4a521762eb4943c7dbbe747437c49d6b5e3f71f2069ab7262a1322e32cd8ab51167da4ac6f84b9f89768d7b5af703')
b2sums_aarch64=('18671fd961f2cfaad4451bdf13bb979e4cc7684a5abe1d3cfd4e3c99c4dff3c85c98f5497ab696753fb15bb453632fdcb4c1e85add741923c7ca41ebbb1f1c30')
b2sums_riscv64=('5dc16168793f87d4f83676a67b7f3a7c508b2ba0ecfbf95992a9e1caca6680514f01493da313ad68155b7878894d670f97e1771b0e63085144b26033fd95b824')


package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "$_name"
}
