# Maintainer: Kunobi Ninja <feedback@kunobi.ninja>
# This PKGBUILD is generated/updated by kunobi-ninja/kobe CI on each stable
# release (pkgver + checksums refreshed, then pushed to the AUR). It installs
# the official prebuilt, statically linked musl binary from GitHub Releases.
pkgname=kobe-bin
pkgver=0.40.1
pkgrel=1
pkgdesc='CLI for pools of pre-warmed Kubernetes virtual clusters (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/kunobi-ninja/kobe'
license=('Apache-2.0')
provides=('kobe')
conflicts=('kobe')
source_x86_64=("kobe-$pkgver-x86_64.tar.gz::https://github.com/kunobi-ninja/kobe/releases/download/v$pkgver/kobe-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("kobe-$pkgver-aarch64.tar.gz::https://github.com/kunobi-ninja/kobe/releases/download/v$pkgver/kobe-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('030a170aaef6f7776483d84f5c0780f2b9873f64e0f460d0cb924774fe0ebd70')
sha256sums_aarch64=('aafe49218e21aaa4b7218c1da3b7ddbd3a95b66873d82e9e781039913589949c')

package() {
  install -Dm0755 "$srcdir/kobe" "$pkgdir/usr/bin/kobe"
}
