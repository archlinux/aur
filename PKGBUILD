# If you have a problem/question or want to improve this PKGBUILD,
# you can create an issue/pull request on this Github repository:
#
# https://github.com/siaeyy/PKGBUILDs
#
# You can still use the Arch website as well.
#

pkgname=purl-bin
pkgver=0.2.12
pkgrel=1
pkgdesc="A curl-esque CLI for making HTTP requests that require payment"
arch=(x86_64)
url="https://github.com/stripe/purl"
license=(MIT)
depends=(glibc libgcc)
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/purl-linux-amd64")
source=("README-$pkgver.md::$url/raw/v$pkgver/README.md"
        "LICENSE-$pkgver::$url/raw/v$pkgver/LICENSE")
sha256sums=('55f2e071ea2d7416ec27128f0b8aa7613da37f5eaec496c69fdd3e854a0f42f6'
            '2a961afed23e7b11ee7505b86e60162448f4264e98559eb5071f285e78441ac7')
sha256sums_x86_64=('89fac86fdbb7864340c2440764a269a8afa1b29547aec556ab695940191b9366')

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/purl"
    install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
