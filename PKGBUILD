# Maintainer: MeoArch <https://github.com/QwQdoge>
pkgname=meo-account-bin
_pkgname=meo-account
pkgver=0.1.0
pkgrel=11
pkgdesc="Meo Account broker and authentication dialog for MeoArch (prebuilt)"
arch=('x86_64')
url='https://github.com/QwQdoge/MeoArch-account'
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-declarative' 'kwallet' 'meoui-qml>=1.0.4beta1')
provides=('meo-account=0.1.0-11')
conflicts=('meo-account')
backup=('etc/meo-account/broker.conf')
options=('!strip' '!debug')
source=('meo-account-0.1.0-11-x86_64.pkg.tar.zst::https://packages.meoarch.org/meo/os/x86_64/meo-account-0.1.0-11-x86_64.pkg.tar.zst')
noextract=('meo-account-0.1.0-11-x86_64.pkg.tar.zst')
sha256sums=('d4b4539b818aaf82e94e2d39ca9892403569b78f3a1d182b2dcdc715f90b045b')

package() {
  bsdtar -xf "$srcdir/meo-account-0.1.0-11-x86_64.pkg.tar.zst" -C "$pkgdir" --exclude=.PKGINFO --exclude=.BUILDINFO --exclude=.MTREE --exclude=.INSTALL --exclude=.CHANGELOG
}
