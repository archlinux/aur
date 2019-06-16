# Maintainer: lsf
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=librewolf-bin
provides=(${pkgname//-bin/""})
conflicts=(${pkgname//-bin/""})
_pkgname=LibreWolf
pkgver=67.0.2
_bundle=c9edc4fbdfc8a0a5656e43d0afda6df03b93de7c
pkgrel=4
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
source=( $pkgname.desktop
        https://gitlab.com/${pkgname//-bin/""}-community/${_pkgname}-Arch/uploads/aa3638c02c65c90d5f84618703926abd/${pkgname//-bin/""}-${pkgver}-${pkgrel}-x86_64.pkg.tar.xz)
sha256sums=('ad6b1bc47687c8f094a0b8dd077b13099d43fc95469b73ec9890e642512d474e'
            'c9451425670deaa2eaf2eca0ed911a711131d0d0123b38f182ed7d80c9979735')

package() {
  cp -r $srcdir/usr $pkgdir/
}

# vim:set sw=2 et:
