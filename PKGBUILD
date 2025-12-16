# Maintainer: Sorah Fukumori <her@sorah.jp>

pkgname=mairu-bin
pkgdesc="on-memory AWS credentials agent and executor for AWS SSO and others"
pkgver=0.10.0
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/sorah/mairu"
license=('Apache-2.0')
conflicts=('mairu')
provides=('mairu=$pkgver')
_tarball=mairu-$pkgver.tar.gz
source_x86_64=($_tarball::https://github.com/sorah/mairu/releases/download/v$pkgver/mairu-x86_64-unknown-linux-musl.tar.gz)
source_aarch64=($_tarball::https://github.com/sorah/mairu/releases/download/v$pkgver/mairu-aarch64-unknown-linux-musl.tar.gz)
sha256sums_x86_64=('867edd8c0ce2eab2c9f3e67a3a20c0f6994d2b22a449d57be9af01e975c6c5f9')
sha256sums_aarch64=('867edd8c0ce2eab2c9f3e67a3a20c0f6994d2b22a449d57be9af01e975c6c5f9')
sha512sums_x86_64=('78c3810d175fdb19b10b7a0084c3a8e66d2720eeff097d5f2b5dbad4381eab807b46e017054df79cc45b32db4e16d861e0918f9f5430c6bd7c120fdfa34e262d')
sha512sums_aarch64=('78c3810d175fdb19b10b7a0084c3a8e66d2720eeff097d5f2b5dbad4381eab807b46e017054df79cc45b32db4e16d861e0918f9f5430c6bd7c120fdfa34e262d')
install=mairu-bin.install

package() {
  tar -C $srcdir -xf $_tarball
  install -Dm 755 "$srcdir/mairu" "$pkgdir/usr/bin/mairu"
}


