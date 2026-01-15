# Maintainer: tippfehlr <tippfehlr@tippfehlr.dev>
pkgname=cpx-bin
pkgver=1.3.5
pkgrel=1
pkgdesc="Cargo-like CLI for C++, compatible with CMake (vcpkg), Bazel and Meson"
arch=(x86_64 aarch64)
url="https://github.com/ozacod/cpx"
license=(MIT)
depends=(cmake vcpkg bazel meson)
optdepends=()
options=()
source=("$pkgname-LICENSE::https://github.com/ozacod/cpx/blob/v$pkgver/LICENSE")
source_x86_64=("$pkgname-$pkgver::https://github.com/ozacod/cpx/releases/download/v$pkgver/cpx-linux-amd64")
source_aarch64=("$pkgname-$pkgver::https://github.com/ozacod/cpx/releases/download/v$pkgver/cpx-linux-arm64")
sha512sums=('6675525fa2afc7fba564d5de6a971ac0f0956ddc2b802779a95c27d783ee1ca350f93850f1ae8de5cdf4ecf31873d56fa9b8197a101307c1a071fb5b379c8c8d')
sha512sums_x86_64=('734341a9c40fdbd75c8704341bfde6b2a70d66638f246e824cc9ac4fa1782838491676ee92edea7e9113a14cce78474b4121d87334881a3ce98c2586bd1ed483')
sha512sums_aarch64=('734341a9c40fdbd75c8704341bfde6b2a70d66638f246e824cc9ac4fa1782838491676ee92edea7e9113a14cce78474b4121d87334881a3ce98c2586bd1ed483')

package() {
	install -Dm755 $pkgname-$pkgver -t "$pkgdir/usr/bin/"
	install -Dm644 $pkgname-LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
