# Maintainer: EVAIT Security <info@evait-security.de>

pkgname=email_validator-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Fast, statically linked email list validator in Rust"
arch=('x86_64')
url="https://github.com/evait-security/email_validator"
license=('MIT')
provides=("email_validator")
conflicts=("email_validator")
source=("$pkgname-$pkgver::https://github.com/evait-security/email_validator/releases/download/v$pkgver/email_validator"
        "LICENSE")
noextract=("$pkgname-$pkgver")
sha256sums=('2b1d730d16944be9ec2c409e1d87f53e109faaab3280ae34ee77f85b5af04286'
            '26bf0f953738341dc78504377cc5753cc2c61495683b8f94c8d90d395a5b4f88')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/email_validator"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
