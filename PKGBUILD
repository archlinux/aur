pkgname=("python-django-cms" "python2-django-cms")
pkgbase="python-django-cms"
pkgver=3.4.1
pkgrel=1
pkgdesc="An Advanced Django CMS"
url="https://django-cms.org"
arch=('any')
license=('BSD')
source=("$pkgname-$pkgver.tar.gz::https://github.com/divio/django-cms/archive/$pkgver.tar.gz")
md5sums=('458e98b6b83edc60088eb48edba16b84')
 
package_python-django-cms() {
    depends=("python-django" "python-django-classy-tags" "python-django-formtools" "python-treebeard" "python-django-sekizai" "python-djangocms-admin-style")
    cd django-cms-$pkgver
    python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-django-cms() {
    depends=("python2-django" "python2-django-classy-tags" "python2-django-formtools" "python2-treebeard" "python2-django-sekizai" "python2-djangocms-admin-style")
    cd django-cms-$pkgver
    python setup.py install --root="${pkgdir}/" --optimize=1
}
