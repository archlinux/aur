# Maintainer: Prabakaran <prabakaranorganisation@gmail.com>
pkgname=bdh-linux
pkgver=4.2.10
pkgrel=1
pkgdesc="Backend developer environment provisioning CLI for Arch/Manjaro"
arch=('any')
url="https://github.com/BackendDeveloperHub/bdh-linux"
license=('MIT')
depends=('python' 'python-pip')
source=("https://files.pythonhosted.org/packages/source/b/bdh-linux/bdh-linux-${pkgver}.tar.gz")
sha256sums=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')

package() {
    cd "$srcdir/bdh-linux-$pkgver"
    pip install --no-deps --root="$pkgdir" --prefix=/usr .
}
