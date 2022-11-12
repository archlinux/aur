_pkgbase=dmt
pkgname=python-dmt
pkgver=1.4.73
pkgrel=1
pkgdesc="Manage domains like packages."
arch=('x86_64')
license=('GNU GPL v3')
url="https://gitlab.com/waser-technologies/technologies/listen"
depends=('python-pip' 'python38-rasa' 'python38-rasa-sdk')
provides=($pkgname)

prepare()
{
    echo "Installing Domain Management Tools..."
}

package() {
    pip install --root="$pkgdir" $_pkgbase
}
