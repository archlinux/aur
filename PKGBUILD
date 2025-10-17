# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="handy-bin"
pkgver=0.5.3
pkgrel=1
pkgdesc="A free, open source, and extensible speech-to-text application that works completely offline"
url="https://handy.computer/"
license=("MIT")
arch=("x86_64")
depends=("gtk3" "webkit2gtk-4.1" "libappindicator-gtk3")
source=("$pkgname-$pkgver.deb::https://github.com/cjpais/Handy/releases/download/v$pkgver/Handy_${pkgver}_amd64.deb"
        "https://raw.githubusercontent.com/cjpais/Handy/refs/heads/main/LICENSE")
b2sums=('4fd92f5cbf59fd956a4375a959b3c47886cf24e672a56a7ea9a7eb0869e4a7265ec796cfef1381ba6e086797d79024b5d2add1963d01ee14eaa4f8ac08ece48e'
        '48678eca5b87a0b59038c8b343d84073207bca4390ad40ac81f2f96dc553cc66453f0f6331749d4686aa7153875bdaf2e08b2adf2bef023ee6044518955a7950')

package(){
 bsdtar -xf "data.tar.gz" -C "$pkgdir"
 install -D -m 644 "LICENSE" -t "$pkgdir/usr/share/license/handy"
}
