# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="handy-bin"
pkgver=0.6.0
pkgrel=1
pkgdesc="A free, open source, and extensible speech-to-text application that works completely offline"
url="https://handy.computer/"
license=("MIT")
arch=("x86_64")
depends=("gtk3" "webkit2gtk-4.1" "libappindicator-gtk3")
source=("$pkgname-$pkgver.deb::https://github.com/cjpais/Handy/releases/download/v$pkgver/Handy_${pkgver}_amd64_linux.deb"
        "https://raw.githubusercontent.com/cjpais/Handy/refs/heads/main/LICENSE")
b2sums=('7e2b2bb7e833fc7ab833b3e3ac37ce4c7081a9b6ae609244c82082fb0fbcdef08f2cca3c2db7ea9145163a9f5d77d2a41e06947613fa6bb30b99e363b3fa3865'
        '48678eca5b87a0b59038c8b343d84073207bca4390ad40ac81f2f96dc553cc66453f0f6331749d4686aa7153875bdaf2e08b2adf2bef023ee6044518955a7950')

package(){
 bsdtar -xf "data.tar.gz" -C "$pkgdir"
 install -D -m 644 "LICENSE" -t "$pkgdir/usr/share/license/handy"
}
