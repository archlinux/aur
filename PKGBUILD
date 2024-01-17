# Maintainer: Nebula <nebula@palera.in>

pkgname=palera1n
pkgver=2.0.0~beta.8
pkgrel=1
pkgdesc="Jailbreak for arm64 devices on iOS 15.0+"
arch=('x86_64')
url="https://palera.in"
licence=('MIT')
source=("https://github.com/palera1n/palera1n/releases/download/v2.0.0-beta.8/palera1n-linux-x86_64"
        "https://github.com/palera1n/palera1n/releases/download/v2.0.0-beta.8/palera1n.1")
sha256sums=('dda3a286aa981f19528eb9d28bc380ef3f093df356fa49156d6765bee690fdd2'
            '01abfbc42979912c7c0b0e3cffef1ce2cec809bd176bcc2c9db8e7fb114d5f82')
options=('!strip')
package() {
    echo "  -> Moving files in place..."
    install -Dm755 "palera1n-linux-x86_64" "$pkgdir"/usr/bin/palera1n
    install -Dm644 "palera1n.1" "$pkgdir"/usr/share/man/man1/palera1n.1
}
