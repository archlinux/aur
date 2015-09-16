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
pkgver=1.8
pkgrel=1
pkgdesc="A fully automated backup checker"
arch=(any)
url="https://github.com/backupchecker/backupchecker"
license=('GPLv3')
depends=('python>=3.4')
source=("https://github.com/backupchecker/backupchecker/archive/${pkgver}.tar.gz")
md5sums=('3b316ca50b329906719432892db2433f')

package() {
  cd "$srcdir"/$pkgname-$pkgver

  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
