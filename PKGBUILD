# Maintainer: lsf

pkgname=librewolf-bin
provides=(${pkgname//-bin/""})
conflicts=(${pkgname//-bin/""})
_pkgname=LibreWolf
pkgver=69.0.1
_uploadpath='300645263'
pkgrel=1
pkgdesc="Community-maintained fork of Librefox: a privacy and security-focused browser"
arch=(x86_64)
license=(MPL GPL LGPL)
url="https://LibreWolf.gitlab.io"
depends=(gtk3 mozilla-common libxt startup-notification mime-types dbus-glib
         ffmpeg nss ttf-font libpulse)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
options=(!emptydirs)
install='librewolf-bin.install'
source=(https://gitlab.com/${pkgname//-bin/""}-community/browser/arch/-/jobs/${_uploadpath}/artifacts/raw/${pkgname//-bin/""}-${pkgver}-${pkgrel}-x86_64.pkg.tar.xz)
sha256sums=('5ead5a2e0d1bd960deba055bf2e81e65cc627f1f894eb154d579f093ab6c5160')

package() {
  cp -r $srcdir/usr $pkgdir/
}
