# Maintainer: celenity <celenity@celenity.dev>
pkgname=dove-policies
pkgver=20241027
pkgrel=1
pkgdesc="Standard Dove policies for Mozilla Thunderbird"
arch=(any)
license=('GPL3')
url="https://dove.celenity.dev"
source=("git+https://codeberg.org/celenity/Dove.git#commit=676b29563f26d115e79a610ac43f4438a3578d87")
sha512sums=('SKIP')

pkgver() {
    echo "$pkgver"
}

package() {
    install -Dm644 "$srcdir/Dove/Policies/Linux/Policies/policies.json" "$pkgdir/usr/lib/firefox/distribution/policies.json"
}