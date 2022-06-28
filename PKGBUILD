# Maintainer: Kenny MacDermid <kenny.macdermid@gmail.com>
pkgname=aws-adfs
pkgver=2.4.0
pkgrel=1
pkgdesc="Command line tool to ease aws cli authentication against ADFS "
arch=('any')
url="https://github.com/venth/aws-adfs"
license=('MIT')
depends=('python'
         'python-boto3'
         'python-botocore'
         'python-click'
         'python-fido2'
         'python-lxml'
         'python-requests'
         'python-requests-kerberos')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/venth/aws-adfs/releases/download/$pkgver/aws-adfs-$pkgver.tar.gz")
sha256sums=('7b6009f4b268ab8fa0b7dbd2c8e5121a4226a06bf7103f8602a5bac14730e94e')
sha512sums=('65871de511533b8af0ff480406c960987417ff069b1b918e2f347e4f6d5fd1f7a4917c0b6689dd2bef0c1e50f2eca2387dc46dcc95976c132c75c568c80b559f')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
