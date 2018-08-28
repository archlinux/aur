# Maintainer: liberodark

pkgname=cycligent-git-tool
pkgver=0.5.2
pkgrel=1
pkgdesc="Cross-platform, Actionable, Graphical Git Dashboard"
arch=('x86_64')
url="https://www.cycligent.com"
license=('Custom')
depends=('xdg-utils')
source_x86_64=("https://s3-us-west-2.amazonaws.com/cycligent-downloads/CycligentGitTool/installers/linux/x64/CycligentGitTool-0.5.2-linux-x64.deb")
sha512sums_x86_64=('2cc6ed96d80ec710672c31506b350daf753b11110cd65178d50cd1994b4a038b0610b22d7aa064941ba6785188b2769b8d1bf6993a0aec39b91fd8e335fb9d23')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r usr $pkgdir
}

