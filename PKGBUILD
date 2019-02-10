# Submitter: Nbiba Bedis <bedisnbiba@gmail.com>

pkgname=('python-better-exceptions-fork')
_pkgfolder="better-exceptions-master"
pkgver=0.2.1
pkgrel=8
pkgdesc='Pretty and helpful exceptions, automatically'
arch=('any')
url='https://github.com/Delgan/better-exceptions'
license=('MIT')
depends=('python')
conflicts=('python-better-exceptions')
makedepends=('python-setuptools')
source=("https://github.com/Delgan/better-exceptions/archive/master.zip"
"setup-fork.py"
"README.rst")
md5sums=('29068e4a8f946b390aafae240a0f0470'
         'f093af63207198b670b7d58fe560687b'
         '83ecd950ae1cb65741103a0501066258')


package() {
  mv setup-fork.py README.rst $_pkgfolder
  cd $_pkgfolder
  python setup-fork.py install --root="$pkgdir/" --optimize=1
}