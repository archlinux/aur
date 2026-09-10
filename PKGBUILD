# Maintainer: Kunobi Ninja <feedback@kunobi.ninja>
# This PKGBUILD is generated/updated by kunobi-ninja/kobe CI on each stable
# release (pkgver + checksums refreshed, then pushed to the AUR). It installs
# the official prebuilt, statically linked musl binary from GitHub Releases.
pkgname=kobe-bin
pkgver=0.44.1
pkgrel=1
pkgdesc='CLI for pools of pre-warmed Kubernetes virtual clusters (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/kunobi-ninja/kobe'
license=('Apache-2.0')
provides=('kobe')
conflicts=('kobe')
source_x86_64=("kobe-$pkgver-x86_64.tar.gz::https://github.com/kunobi-ninja/kobe/releases/download/v$pkgver/kobe-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("kobe-$pkgver-aarch64.tar.gz::https://github.com/kunobi-ninja/kobe/releases/download/v$pkgver/kobe-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('193b35879e1683188e34d20192f83b5d2c3f441853c0ad7238ff51ae43284b0b')
sha256sums_aarch64=('241e65413079b0b488dfb8918e7f6d5079c378ba0ae4eacd3033ad6024ed0383')

package() {
  install -Dm0755 "$srcdir/kobe" "$pkgdir/usr/bin/kobe"
}
