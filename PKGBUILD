#Maintainer: nezbednik <nezbedniklmao@gmail.com>
pkgname=customizemii-base-wads
pkgver=3.11
pkgrel=1
pkgdesc="base WADs for customizemii"
arch=("any")
url="https://code.google.com/archive/p/customizemii/source/default/source"
license=("GPL3")
source=("https://storage.googleapis.com/google-code-archive-source/v2/code.google.com/customizemii/source-archive.zip")
sha256sums=("81ddba3a401e1360249da5b0d9988f58f47105fc4130237072e82a8929f997e6")

package() {
  mkdir -p "$pkgdir/opt/customizemii"
  cd customizemii/branches/Base_WADs
  rm -rf .svn
  cd ..
  mv Base_WADs "$pkgdir/opt/customizemii"
}

