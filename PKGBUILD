# Contributor: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
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
pkgver=1.7
pkgrel=1
pkgdesc="A fully automated backup checker"
arch=(any)
url="https://github.com/backupchecker/backupchecker"
license=('GPLv3')
depends=('python>=3.4')
source=("http://pypi.python.org/packages/source/b/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('1af45f0e18f49effb7ea8942672aa2a4')

package() {
  cd "$srcdir"/$pkgname-$pkgver

  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
