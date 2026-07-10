# Maintainer: EVAIT Security <info@evait-security.de>

pkgname=email_validator-bin
pkgver=0.2.0
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
sha256sums=('038b95c0f76fcc31e2899210f26da9d741f9c79fa374832f3fae58d851d62800'
            '26bf0f953738341dc78504377cc5753cc2c61495683b8f94c8d90d395a5b4f88')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/email_validator"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
