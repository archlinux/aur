_pkgbase=rasa-sdk
pkgname=python38-rasa-sdk
pkgver=3.3.0
pkgrel=1
pkgdesc="SDK for the development of custom actions for Rasa"
arch=('x86_64')
license=('GNU GPL v3')
url="https://github.com/rasahq/rasa-sdk"
depends=('python38-pip')
provides=($_pkgbase)

prepare()
{
    echo "Installing Rasa Open Source NLU..."
}

package() {
    python3.8 -m pip install --root="$pkgdir" $_pkgbase
}
