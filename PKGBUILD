# Maintainer:  kxxt <rsworktech at outlook dot com>
_name=tracexec
pkgname="$_name-bin"
pkgver=0.0.5
pkgrel=1
pkgdesc="A small utility for tracing execve{,at}"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/kxxt/tracexec"
license=('GPL-2.0-or-later')
depends=('gcc-libs')
provides=('tracexec')
conflicts=('tracexec')
backup=()
options=()

source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/kxxt/$_name/releases/download/v$pkgver/$_name-aarch64-unknown-linux-gnu.tar.gz")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/kxxt/$_name/releases/download/v$pkgver/$_name-x86_64-unknown-linux-gnu.tar.gz")
source_riscv64=("$pkgname-$pkgver-riscv64.tar.gz::https://github.com/kxxt/$_name/releases/download/v$pkgver/$_name-riscv64gc-unknown-linux-gnu.tar.gz")
noextract=()
b2sums_x86_64=('dffab505d092ca8d46bf9d8bac865fca34533caf81e28801b57115155e80b2599096836963c7fbe2dee65c822f888d175964fe7866a785455dffadd027043da6')
b2sums_aarch64=('e36e3e51407f699733fd19a7bba395c0838ecbd410dadfae09e9eb4e8fd5f0f8a728348cc36ed7ed06e7c489e51fc57202984c8223c160824a87d935a08ba166')
b2sums_riscv64=('99d20d6acb1efa342652c8b844381bb7b7ad8884f269627242fbd49075d66f219a892ffad08cc58587353a693fe5d7cf53ce609638c649d5d5cc6b3c2d728084')


package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "$_name"
}
