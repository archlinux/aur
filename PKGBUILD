# Maintainer: Ruslan Kondratiuk <ruslan.kondratiuk.dev@gmail.com>
_name=adless
pkgname=$_name-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="Local domains blocker written in Go"
arch=(x86_64 aarch64)
url="https://github.com/WIttyJudge/adless"
license=('Apache License 2.0')
provides=($_name)
conflicts=($_name $_name-git)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v${pkgver}/${_name}_v${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v${pkgver}/${_name}_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('0a7a86b34da8a276422dbc3c81c75a12c416b611a267ec484af6d3a5fbdac726')
sha256sums_aarch64=('929aeac24061e76ff0db9794180276f2f11b3782869f1c8ec949230389a4b60')

package() {
    install -Dm775 $_name "$pkgdir"/usr/bin/$_name
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
