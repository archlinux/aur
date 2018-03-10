# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=('python-pip-bootstrap' 'python2-pip-bootstrap')
pkgver=0.0.1
pkgrel=1
pkgdesc="bootstap pip and setuptools for bootstrapping python"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://bootstrap.pypa.io/"
source=("https://bootstrap.pypa.io/get-pip.py")
sha512sums=('29971130c5d1d1baf2b51ef689b40c91fcd0d1e62de6f99d6abef6879684a59843be539cd112dfddc3637cc3d1a91c79f775d80f6aa2fe920252710d48d2934d')

package_python-pip-bootstrap(){
	cd "${srcdir}"
	python get-pip.py
}

package_python2-pip-bootstrap(){
	cd "${srcdir}"
	python2 get-pip.py
}
