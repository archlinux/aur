# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=ansible-container
pkgver=0.9.2
pkgrel=1
pkgdesc="Ansible Container is a tool to build and orchestrate containers using only Ansible playbooks."
arch=('any')
url="https://github.com/ansible/ansible-container"
license=('GPL')
depends=('python-structlog' 'python-six' 'python-jinja' 'python-ruamel-yaml' 'python-pip'
         'python-requests' 'python-yaml' 'python-colorama' 'python-structlog')
optdepends=('python-docker: building docker containers')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ansible/ansible-container/archive/release-$pkgver.tar.gz")
md5sums=('fa3bebf7d0f30771bda3f15075fdd411')

package() {
	cd "$pkgname-release-$pkgver"
        python setup.py install --root="${pkgdir}"
}
