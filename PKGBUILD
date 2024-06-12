# PKGBUILD maintainer: Eric Bailey <nerflad@gmail.com> AUR: nerflad
# Maintainer: Josh Dye
# Contributor: Maximilien Noal <noal.maximilien@gmail.com> AUR: xcomcmdr

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
pkgrel=3
pkgdesc='A public domain, high quality MIDI soundfont by Luke Sena'
arch=('any')
license=('custom: public domain')
url='http://www.titanicsf.com'
sha1sums=('8941d35771b56f3c6abd2b0bbb5085fd0a2b1e0d'
          'ad8452acc1455449e2cb9488fcb6d70323aa4ee5')
source=('https://www.dropbox.com/s/5yzhvlrkf7s3tb2/titanic.sf2'
    'LICENSE')

# This is an AUR script. Do not compress the package.
PKGEXT='.pkg.tar'

package() {
    pwd
    install -Dm644 titanic.sf2 "${pkgdir}/usr/share/soundfonts/titanic.sf2"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
