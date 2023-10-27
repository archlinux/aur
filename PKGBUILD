# Maintainer:  kxxt <rsworktech at outlook dot com>
_name=tracexec
pkgname="$_name-bin"
pkgver=0.0.2
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
b2sums_x86_64=('f7a44a808e1bdcff58296d2778421d5090eb625455e142e40d7168a2ab3f759865a7c5497ec8475aea5f6775227721e155cb842e9bd2060d59811f6285e5acd2')
b2sums_aarch64=('70f74265a4b2300acd86083adad4ee31e72462c2eda3e7bef0c5602aca34511c1fa921f61c44550bd0dc31c4c18f0b937350ab4510d3fbf795c547bef80f73d8')
b2sums_riscv64=('45abda88be24b60ed77b82aa4a2b69305c85674d17aee01c3a8d1d81a2907fcb29e30b936bee5103a14d64a3a1f44fbc939bbb1f1741d5d1eade04f37c17acee')


package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "$_name"
}
