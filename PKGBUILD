# Maintainer: FuzzyAtish
# Contributor: Tomasz Zok
pkgname=classroom-assistant
pkgver=2.0.4
pkgrel=1
pkgdesc="GitHub Classroom Assistant is a cross-platform desktop application to help you get student repositories for grading."
arch=(x86_64)
url="https://github.com/education/classroom-assistant"
license=('MIT')
source=("https://github.com/education/$pkgname/releases/download/v$pkgver/classroom-assistant-$pkgver-$pkgrel.$arch.rpm")
md5sums=('4b3cc3ad0cc6cec68a7a26d14be74816')
optdepends=('gnome-keyring')

package() {
    echo "MimeType=x-scheme-handler/x-github-classroom" >> $srcdir/usr/share/applications/classroom-assistant.desktop
    mv $srcdir/usr $pkgdir
}
