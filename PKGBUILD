pkgname="mkdocs"
pkgver=1.2.3
pkgrel=2
pkgdesc="Project documentation with Markdown"
url="https://www.mkdocs.org"
license=("BSD")
arch=("any")
provides=("mkdocs")
conflicts=("python-mkdocs" "mkdocs")
makedepends=("rpmextract")
depends=(
	 "python310"
	 "python-babel"
         "python-click"
         "python-dateutil"
         "python-ghp-import"
         "python-jinja"
         "python-importlib-metadata"
         "python-livereload"
         "python-markdown"
         "python-markupsafe"
         "python-mergedeep"
         "python-mdx-gh-links"
         "python-packaging"
         "python-pyyaml-env-tag"
         "python-yaml"
         "python-watchdog")
optdepends=("python-lunr: to prebuild search index")
source=("https://download-ib01.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/aarch64/os/Packages/m/mkdocs-${pkgver}-1.fc36.noarch.rpm")
sha256sums=('3a39b58133c8ef16415f1c14f592b3a8d9be3775035ce15b737919a9e433c6fe')
#prepare(){
# rpm2cpio ${source} | cpio -div
#}
package(){
 mkdir -p "$pkgdir"/usr
 cd "$srcdir"
 chmod 755 -R usr
 cp -r "$srcdir"/usr/* "$pkgdir"/usr
}
