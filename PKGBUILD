# Maintainer: Allen Faure afaure6 at gmail dot com
pkgname=bigwigs-packager
pkgver="1.0.3"

pkgrel="2"
pkgdesc="Generate an addon zip file from a Git, SVN, or Mercurial checkout."
url='https://github.com/BigWigsMods/packager/'
arch=("x86_64")
license=("Unlicense")
source=("https://raw.githubusercontent.com/BigWigsMods/packager/cd3d45ed8c7b1123bf5d2dffccc5241e2ec4971c/release.sh")
sha512sums=('054bb4e82c512e572dcad1ac4232e54887827d0778fe74793b4b4cd86cbb3fe82a4aedfe2925bc4f68205dad2ebf4b951d4d50fda6cfd21bcb53bbc54c48a9ff')
depends=("git" "svn")
package() {
  mkdir -p "${pkgdir}/usr/bin"
  cp "${srcdir}/release.sh" "${pkgdir}/usr/bin/bw-pack"
  chmod +x "${pkgdir}/usr/bin/bw-pack"
}
