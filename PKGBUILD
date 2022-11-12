_pkgbase=rasa
pkgname=python38-rasa
pkgver=3.3.1
pkgrel=1
pkgdesc="Open source machine learning framework to automate text- and voice-based conversations: NLU, dialogue management, connect to Slack, Facebook, and more - Create chatbots and voice assistants"
arch=('x86_64')
license=('GNU GPL v3')
url="https://github.com/RasaHQ/rasa"
depends=('python38-pip')
provides=($pkgname)

prepare()
{
    echo "Installing Rasa Open Source NLU..."
}

package() {
    python3.8 -m pip install --root="$pkgdir" $_pkgbase
}
