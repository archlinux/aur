# Maintainer: esrh : email at esrh.me/pages/contact.html
pkgname=ames
pkgver=v0.1.4
pkgrel=1
pkgdesc="Update anki cards with desktop audio and images"
arch=('any')
url="https://github.com/eshrh/ames"
license=('GPL3')
depends=('pulseaudio' 'ffmpeg' 'maim' 'xdotool' 'libnotify' 'xsel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/eshrh/ames/archive/refs/tags/$pkgver.tar.gz")
md5sums=('SKIP')
install="ames.install"

package() {
        tar -xzf "$pkgname-$pkgver.tar.gz"
        cd "$srcdir/$pkgname-${pkgver:1}"
        install -Dm755 ames.sh "$pkgdir"/usr/bin/ames
        install -Dm644 config "$pkgdir"/usr/share/ames/config
}
