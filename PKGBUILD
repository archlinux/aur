# Maintainer: killruana <killruana@gmail.com>
pkgname=django-bash-completion
pkgver=1.8.4
pkgrel=1
epoch=
pkgdesc="This bash script adds tab-completion feature to django-admin.py and manage.py"
arch=('any')
url="https://www.djangoproject.com/"
license=('BSD')
groups=()
depends=('bash')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://raw.githubusercontent.com/django/django/$pkgver/extras/django_bash_completion")
noextract=()
sha512sums=('9fd97abcd53578850c5fe1c8d8b84b7d147981fa98d75d03117979ced8a34ad66ebf14bc0ee01f9a72f329119e1889cd01d7c103d68fe8c2f9e789c721d88c4a')
validpgpkeys=()

prepare() {
    echo "prepare $PWD"
}

build() {
    echo "build $PWD"
}

package() {
    echo "package $PWD"
    install -D -m 644 django_bash_completion $pkgdir/usr/share/django-bash-completion/django-bash-completion.sh
}
