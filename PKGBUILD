# Maintainer: Marat Talipov <t-marat@yandex.ru>

pkgname=ansible-openstack-inventory
pkgver=21.11.25
pkgrel=1
pkgdesc="OpenStack dynamic inventory script for Ansible"
arch=('x86_64')
license=('GNUv3')
depends=(
    'python'
)
url="https://docs.ansible.com/ansible/latest/user_guide/intro_dynamic_inventory.html"
source=("https://raw.githubusercontent.com/openstack/ansible-collections-openstack/master/scripts/inventory/openstack_inventory.py")
sha256sums=('61b541da6c34c659b730b479a4bba2e897da2e1a582c6a42a6073b5dcfca9139')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    cp "${srcdir}/openstack_inventory.py" "${pkgdir}/usr/bin/${pkgname}"
    chmod +x "${pkgdir}/usr/bin/${pkgname}"
}