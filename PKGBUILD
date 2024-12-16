# Maintainer: Ruslan Kondratiuk <ruslan.kondratiuk.dev@gmail.com>
_name=adless
pkgname=$_name-bin
pkgver=1.0.4
pkgrel=1
pkgdesc="Local domains blocker written in Go"
arch=(x86_64 aarch64)
url="https://github.com/WIttyJudge/adless"
license=('Apache License 2.0')
provides=($_name)
conflicts=($_name $_name-git)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v${pkgver}/${_name}_v${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v${pkgver}/${_name}_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('d565220dfa6536d884d67b3673ea040051f83a2082b762e1292946f74fb98e77')
sha256sums_aarch64=('3918aae3f5a0d1229faa18a1ecfc853936d10d92c3dcc8f290170ada8fb46fc5')

package() {
    install -Dm775 $_name "$pkgdir"/usr/bin/$_name
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
