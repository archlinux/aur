# Maintainer: Josh Dye
# Contributor: Maximilien Noal <noal dot maximilien at gmail dot com> [AUR: xcomcmdr]

# The official website is long gone, but:
# - the soundfont itself is available on a few other websites
# - It's readme was posted here: http://www.kvraudio.com/forum/viewtopic.php?p=3019215
# Rather than downloading the soundfont from websites without permission or bothering to get one,
# I made it available publicly on my own Dropbox account.

# The license is from the "Copyright Notice" section of the readme.
# It states also that the soundfont is released in the public domain, but
# that some sounds included did not have any copyright information.
# For details, please see the readme.

pkgname='soundfont-titanic'
pkgver='1.2'
pkgrel=2
pkgdesc='A public domain, high quality MIDI soundfont by Luke Sena'
arch='any'
license='custom: public domain'
url='http://www.titanicsf.com'
md5sums=('06da89576208a6384492afa7f934ffc4' 'a2c2f33d92f54e62e25da9bc647c8b35')
source=('https://www.dropbox.com/s/g0yxy0326jgar34/titanic.sf2' 'LICENSE')

# This is an AUR script. Do not compress the package.
PKGEXT='.pkg.tar'

package() {
  install -Dm644 titanic.sf2 "${pkgdir}/usr/share/soundfonts/titanic.sf2"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
