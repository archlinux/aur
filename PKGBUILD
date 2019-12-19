# Contributor: Phillip Smith <pkgbuild@phs.id.au>
# http://github.com/fukawi2/aur-packages

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=backupchecker
pkgver=1.9
pkgrel=2
pkgdesc="A fully automated backup checker"
arch=(any)
url="https://pypi.org/project/backupchecker"
license=('GPLv3')
depends=('python>=3.4')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/22/75/32b8dc7103c4b14555ab6842ff872a8766cbc0de564892cfe5c48128a0a1/backupchecker-1.9.tar.gz")
md5sums=('19947800f68d29efce5becbfb6202c03')

package() {
  cd "$srcdir"/$pkgname-$pkgver

  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
