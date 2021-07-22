# Maintainer: Thomas Eizinger <thomas@eizinger.io>
pkgname=tensorflow115
pkgver="1.15.2"
pkgrel=0
epoch=
pkgdesc="Tensorflow 1.15"
arch=(x86_64 aarch64)
url="https://github.com/tensorflow/tensorflow"
license=('Apache-2.0')
groups=()
depends=(gcc-libs)
makedepends=()
checkdepends=()
optdepends=()
provides=(tensorflow libtensorflow_framework)
conflicts=(tensorflow tensorflow-cuda tensorflow-opt tensorflow-opt-cuda)
replaces=()
backup=()
options=()
install=
changelog=
source=("dummy")
source_x86_64=("https://dl.photoprism.org/tensorflow/linux/libtensorflow-linux-cpu-1.15.2.tar.gz")
source_aarch64=("https://dl.photoprism.org/tensorflow/arm64/libtensorflow-arm64-1.15.2.tar.gz")
noextract=()
sha256sums=("SKIP")
sha256sums_x86_64=("6d9002dcf271a9c8ee18ce1170db7362d920dc50f74ab3b96de0ec3e829e9f37")
sha256sums_aarch64=("aa78f8be149682b93c4888f3207d7fe3068cc4cb31314bea75864f6926942519")
validpgpkeys=()

package() {
	cd "$srcdir"

	install -Dm755 "lib/libtensorflow.so" "$pkgdir/usr/lib/libtensorflow.so"
	install -Dm755 "lib/libtensorflow_framework.so" "$pkgdir/usr/lib/libtensorflow_framework.so"
	cp -R "include/" "$pkgdir/usr"
}
