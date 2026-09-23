# Maintainer: Kunobi Ninja <feedback@kunobi.ninja>
# This PKGBUILD is generated/updated by kunobi-ninja/kobe CI on each stable
# release (pkgver + checksums refreshed, then pushed to the AUR). It installs
# the official prebuilt, statically linked musl binary from GitHub Releases.
pkgname=kobe-bin
pkgver=0.55.3
pkgrel=1
pkgdesc='CLI for pools of pre-warmed Kubernetes virtual clusters (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/kunobi-ninja/kobe'
license=('Apache-2.0')
provides=('kobe')
conflicts=('kobe')
source_x86_64=("kobe-$pkgver-x86_64.tar.gz::https://github.com/kunobi-ninja/kobe/releases/download/v$pkgver/kobe-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("kobe-$pkgver-aarch64.tar.gz::https://github.com/kunobi-ninja/kobe/releases/download/v$pkgver/kobe-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('45e927f228e1f421792b68c95731850068da1d93b71623c8a6b1e8b3b6f5fc02')
sha256sums_aarch64=('5352e0e2c9c44efcad056183cc57603d7aec2a3f629a2f7b97740787fe6cf0d7')

package() {
  install -Dm0755 "$srcdir/kobe" "$pkgdir/usr/bin/kobe"
}
