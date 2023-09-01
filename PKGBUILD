# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=drtl-bin
pkgver=0.0.10
pkgrel=1
pkgdesc='Yet another tldr client written in Zig.'
url='https://github.com/jiripospisil/drtl'
source_x86_64=("https://github.com/jiripospisil/drtl/releases/download/v$pkgver/drtl-v$pkgver-x86_64-linux")
source_aarch64=("https://github.com/jiripospisil/drtl/releases/download/v$pkgver/drtl-v$pkgver-aarch64-linux")
arch=('x86_64' 'aarch64')
provides=('drtl')
conflicts=('drtl')
license=('MIT')
b2sums_x86_64=('1a84b15fbe5106c00791e14a341e34eb23d4c4e601503d2e483348ffcbd5a603909992341912aeb8a55b9f0cbbefa721bdbc17233258e5f774e40f24ba790f31')
b2sums_aarch64=('796b1eff459d0b0ae06f22b520842886934f7f480a1cce3a94df5938ee651dc5c2cc51403d7eb2c4c0e3c63600cf3799d0e119e30c1180e59d6cecd925892eb2')

package() {
  install -Dm755 "$srcdir/drtl-v$pkgver-$CARCH-linux" "$pkgdir/usr/bin/drtl"
}
