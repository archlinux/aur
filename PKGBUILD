# Maintainer: Allen Faure afaure6 at gmail dot com
pkgname=bigwigs-packager
pkgver="2.0.1"

pkgrel="1"
pkgdesc="Generate an addon zip file from a Git, SVN, or Mercurial checkout."
url='https://github.com/BigWigsMods/packager/'
arch=("x86_64")
license=("Unlicense")
source=("https://raw.githubusercontent.com/BigWigsMods/packager/7025b62bbfe17817deca7caddaf572af8117fa47/release.sh")
sha512sums=('514bc6d4bce2f3615bb6dff0de82c2b51db7af204f04871e3293996ab79b513a77d89bea84ce54dec3518e29c0661efbc2655924d4bae969df731afc423dc74b')
depends=("git" "svn" "mercurial")
package() {
  mkdir -p "${pkgdir}/usr/bin"
  cp "${srcdir}/release.sh" "${pkgdir}/usr/bin/bw-pack"
  chmod +x "${pkgdir}/usr/bin/bw-pack"
}
