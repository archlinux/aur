# Maintainer: Kunobi Ninja <feedback@kunobi.ninja>
# This PKGBUILD is generated/updated by kunobi-ninja/kobe CI on each stable
# release (pkgver + checksums refreshed, then pushed to the AUR). It installs
# the official prebuilt, statically linked musl binary from GitHub Releases.
pkgname=kobe-bin
pkgver=0.42.1
pkgrel=1
pkgdesc='CLI for pools of pre-warmed Kubernetes virtual clusters (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/kunobi-ninja/kobe'
license=('Apache-2.0')
provides=('kobe')
conflicts=('kobe')
source_x86_64=("kobe-$pkgver-x86_64.tar.gz::https://github.com/kunobi-ninja/kobe/releases/download/v$pkgver/kobe-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("kobe-$pkgver-aarch64.tar.gz::https://github.com/kunobi-ninja/kobe/releases/download/v$pkgver/kobe-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('265e6a74968010abce000dfc4e87236b3a8e698e82afdc5b08eb6649c4a1a415')
sha256sums_aarch64=('e6f59f7418e86189cacb2dcc95e0b85d2e7cfb7192ac54e0aed6af163bde3e97')

package() {
  install -Dm0755 "$srcdir/kobe" "$pkgdir/usr/bin/kobe"
}
