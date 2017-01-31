pkgname=("python-djangocms-admin-style" "python2-djangocms-admin-style")
pkgbase=python-djangocms-admin-style
pkgver=1.2.6.2
pkgrel=1
pkgdesc='Adds pretty CSS styles for the django CMS admin interface.'
arch=('any')
url="http://pypi.python.org/pypi/djangocms-admin-style/"
license=('BSD')
source=("https://pypi.python.org/packages/1f/87/5360d70729d2e03275a550cfe383acaff564ad2663ecd949a77d5f648d9e/djangocms-admin-style-1.2.6.2.tar.gz")
md5sums=('cd0be52cd95a84eb5df2fbf5ad6e575f')

package_python-djangocms-admin-style() {
    depends=('python')
    cd "$srcdir/djangocms-admin-style-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-djangocms-admin-style() {
    depends=('python2')
    cd "$srcdir/djangocms-admin-style-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
