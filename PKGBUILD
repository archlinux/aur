# Maintainer: Automne von Einzbern <archlinux@automne.me>

_pkgname=vmware-sddc-manager
pkgname=python-vmware-sddc-manager
pkgver=9.0.0.0
pkgrel=1
pkgdesc="VMware SDDC Manager Python API Bindings"
arch=('any')
url="https://pypi.org/project/vmware-sddc-manager/"
license=('MIT')
depends=('python' 'python-vmware-vapi-common-client' 'python-vmware-vapi-runtime')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/a3/e6/a41a6fc470fbdf5f0f12bbdfc07eecb2318e75feea358f8681b07f2aca81/vmware_sddc_manager-${pkgver}-py3-none-any.whl")
sha256sums=('67e1ec1e55ce1ab518ebff046b7f9d4314828dc9919de679fd62a95db7e1a7c3')

package() {
    pip install --root="$pkgdir" --ignore-installed --no-deps --no-cache-dir "${srcdir}/vmware_sddc_manager-${pkgver}-py3-none-any.whl"
}
