# Maintainer: Kunobi Ninja <feedback@kunobi.ninja>
# This PKGBUILD is generated/updated by kunobi-ninja/kobe CI on each stable
# release (pkgver + checksums refreshed, then pushed to the AUR). It installs
# the official prebuilt, statically linked musl binary from GitHub Releases.
pkgname=kobe-bin
pkgver=0.51.0
pkgrel=1
pkgdesc='CLI for pools of pre-warmed Kubernetes virtual clusters (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/kunobi-ninja/kobe'
license=('Apache-2.0')
provides=('kobe')
conflicts=('kobe')
source_x86_64=("kobe-$pkgver-x86_64.tar.gz::https://github.com/kunobi-ninja/kobe/releases/download/v$pkgver/kobe-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("kobe-$pkgver-aarch64.tar.gz::https://github.com/kunobi-ninja/kobe/releases/download/v$pkgver/kobe-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('95b6c1eb176b61453d0309faa226b5fd5ef16a61d9e27f2751e2dea7cf5b0fca')
sha256sums_aarch64=('0ffadb76e1416bef46057177aa7bf86c5d802d657c54cb21b4980d96eace400c')

package() {
  install -Dm0755 "$srcdir/kobe" "$pkgdir/usr/bin/kobe"
}
