# Maintainer: Duy Truong <jimreynold2nd@yahoo.com>

pkgname=python2-jira
pkgdesc="Python2 library for interacting with JIRA via REST APIs."
pkgver=0.50
pkgrel=1
url="https://pypi.python.org/pypi/jira"
license=('GPL')
arch=('any')
depends=('python2' 'python2-setuptools')
source="https://pypi.python.org/packages/source/j/jira/jira-0.50.tar.gz"
md5sums=('23abea2446beb4161ce50bab13654319')

package(){
        tar -zxvf jira-${pkgver}.tar.gz
        cd jira-${pkgver}
        python2 setup.py install --root="${pkgdir}" --optimize=1
    rm ${pkgdir}/usr/bin/jirashell
}

