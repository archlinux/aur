_pkgbase=tts-say
pkgname=python-tts-say
pkgver=2.2.52
pkgrel=1
pkgdesc="echo but with TTS"
arch=('x86_64')
license=('MPL2')
url="https://gitlab.com/waser-technologies/technologies/say"
depends=('python-pip')
provides=($pkgname)

prepare() {
    echo "Installing TTS Say..."
}

package() {
    pip install --root="$pkgdir" $_pkgbase
}
