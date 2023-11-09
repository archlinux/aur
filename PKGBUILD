# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=drtl-bin
pkgver=0.0.13
pkgrel=1
pkgdesc='Yet another tldr client written in Zig.'
url='https://github.com/jiripospisil/drtl'
source_x86_64=("https://github.com/jiripospisil/drtl/releases/download/v$pkgver/drtl-v$pkgver-x86_64-linux")
source_aarch64=("https://github.com/jiripospisil/drtl/releases/download/v$pkgver/drtl-v$pkgver-aarch64-linux")
arch=('x86_64' 'aarch64')
provides=('drtl')
conflicts=('drtl')
license=('MIT')
b2sums_x86_64=('896d06d68776abd0ce5f58913481e18145b068ab17523478f93b80f1c9c092d729650dd3917933c7232818da99f8f206bee27f93cd6eeb27a7b6c513e8e66e70')
b2sums_aarch64=('fe87a4e1af482c4d684830fd446ace142b053007e89cd9c41126611fde0940d8b436b0910e3faf1e0f21832d018ba7efc27c4b34cb7fb40ba1ba1560b4eb6fa1')

package() {
  install -Dm755 "$srcdir/drtl-v$pkgver-$CARCH-linux" "$pkgdir/usr/bin/drtl"
}
