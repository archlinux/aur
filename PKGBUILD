# Maintainer: lsf
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=librewolf-bin
provides=(${pkgname//-bin/""})
conflicts=(${pkgname//-bin/""})
_pkgname=LibreWolf
pkgver=67.0.4
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
# $pkgname.desktop
source=(https://gitlab.com/${pkgname//-bin/""}-community/${_pkgname}-Arch/uploads/39e52b49ca34096d0bb89c785efb4317/${pkgname//-bin/""}-${pkgver}-${pkgrel}-x86_64.pkg.tar.xz)
sha256sums=('47d77bcd7e1384ad900bb031ab8a9012c7c71ebfbbdd033ee2afb02ca0f80565')

package() {
  cp -r $srcdir/usr $pkgdir/
}

# vim:set sw=2 et:
