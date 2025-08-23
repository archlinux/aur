# Maintainer: Automne von Einzbern <archlinux@automne.me>

_pkgname=vmware-vsan-data-protection
pkgname=python-vmware-vsan-data-protection
pkgver=9.0.0.0
pkgrel=1
pkgdesc="VMware vSAN Data Protection Python API Bindings"
arch=('any')
url="https://pypi.org/project/vmware-vsan-data-protection/"
license=('MIT')
depends=('python' 'python-vmware-vapi-common-client' 'python-vmware-vapi-runtime')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/1f/9b/a124bd079b73ea4d464d279a2b44f440b97241baa9e92127bf7bf1c83bea/vmware_vsan_data_protection-${pkgver}-py3-none-any.whl")
sha256sums=('e7364317da01b3c7eb3b5a3fe2fc280f7fcca3631264c422ca19f2189680657a')

package() {
    pip install --root="$pkgdir" --ignore-installed --no-deps --no-cache-dir "${srcdir}/vmware_vsan_data_protection-${pkgver}-py3-none-any.whl"
}
