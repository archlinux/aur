# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Fantix King <fantix.king@gmail.com>

pkgname=granted-bin
pkgver=0.39.0
pkgrel=1
pkgdesc="CLI tool that simplifies access to cloud roles in your web browser"
arch=(x86_64 i686 aarch64)
url="https://github.com/fwdcloudsec/granted"
license=(MIT)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/granted_${pkgver}_linux_x86_64.tar.gz")
source_i686=("$pkgname-$pkgver-i686.tar.gz::$url/releases/download/v$pkgver/granted_${pkgver}_linux_i386.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/granted_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('89ef34c1e0624c6e583bae4f2a57ddc6e93597aea73612256ae4722057168405')
sha256sums_i686=('045ba115da2ca7744b5e34c7cecf7f74541e9c72327bef1e76605b927950f151')
sha256sums_aarch64=('9c58bc4cb4c808dfb01d391f37eb3e5e27ebd2cecdff9644a95b781e9215a57e')

package() {
    install -Dm755 granted assumego assume -t "$pkgdir/usr/bin/"
}
