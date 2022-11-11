_pkgbase=stt-listen
pkgname=python-stt-listen
pkgver=2.3.42
pkgrel=1
pkgdesc="Transcribe long audio files with STT or use the streaming interface"
arch=('x86_64')
license=('GNU GPL v3')
url="https://gitlab.com/waser-technologies/technologies/listen"
depends=('python-pip' 'python-pyaudio')
provides=($pkgname)

prepare()
{
    echo "Installing STT Listen..."
}

package() {
    pip install --root="$pkgdir" $_pkgbase
}
