# Maintainer: Prabakaran <prabakaranorganisation@gmail.com>
pkgname=bdh-linux
pkgver=4.2.10
pkgrel=1
pkgdesc="Backend developer environment provisioning CLI for Arch/Manjaro"
arch=('any')
url="https://github.com/BackendDeveloperHub/bdh-linux"
license=('MIT')
depends=('python' 'python-pip')
source=("https://files.pythonhosted.org/packages/py3/b/bdh_linux/bdh_linux-${pkgver}-py3-none-any.whl")
sha256sums=('c4b07fec07b3d352aa57fd641d00d86dc8c41f6a6e5424b4a290e558930de0db')
noextract=("bdh_linux-${pkgver}-py3-none-any.whl")

package() {
    pip install --no-deps --root="$pkgdir" --prefix=/usr \
        "${srcdir}/bdh_linux-${pkgver}-py3-none-any.whl"
}
