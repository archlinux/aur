# Maintainer: Nathan Robinson <nrobinson2000 at me dot com>
# Contributor: Twilio DevEd

pkgname=twilio-quest-bin
pkgver=2019.09.27
pkgrel=1
pkgdesc="Discover your power to change the world with code."
arch=('x86_64')
url="https://www.twilio.com/quest"
license=('MIT')
options=('!strip')
source=("${pkgname}-${pkgver}.x86_64.zip::https://firebasestorage.googleapis.com/v0/b/twilioquest-prod.appspot.com/o/launchers%2F8%2Ftwilioquest-linux-amd64.zip?alt=media&token=1ad06f1a-c7c8-438d-aa7b-4faf570c8515")
md5sums=('c3c93d6194fad34a16aa5e8878c9b9da')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'util-linux-libs' 'trash-cli' 'glibc' 'gvfs' 'alsa-lib')

package() {
    bsdtar -O -xf "twilioquest_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
}
