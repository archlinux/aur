# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=ansible-container
pkgver=0.9.1
pkgrel=1
pkgdesc="Ansible Container is a tool to build and orchestrate containers using only Ansible playbooks."
arch=('any')
url="https://github.com/ansible/ansible-container"
license=('GPL')
depends=('python-structlog' 'python-six' 'python-jinja' 'python-ruamel-yaml' 'python-pip' 'python-requests')
optdepends=(
    'python-docker: building docker containers'
    )
source=("$pkgname-$pkgver.tar.gz::https://github.com/ansible/ansible-container/archive/release-$pkgver.tar.gz")
md5sums=('9258f9cdb75303fd4f520ab223a357ac')

package() {
	cd "$pkgname-release-$pkgver"
        python setup.py install --root="${pkgdir}"
}
