# Maintainer : swarnim.114@gmail.com
pkgname=webapp-creator
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple CLI tool to create desktop web applications on Linux"
arch=('any')
url="https://github.com/Swarnim114/webapp-creator"
license=('MIT')
depends=('python')
source=("https://raw.githubusercontent.com/Swarnim114/webapp-creator/main/webapp_creator.py")
sha256sums=('5ec20913040964ea852bb204b577beab99f4b32e61a41e7631e077484ffbb8a8')

package() {
    # Create the destination directory
    install -dm755 "$pkgdir/usr/bin"
    
    # Install the script to /usr/bin/webapp-creator and make it executable
    install -m755 "webapp_creator.py" "$pkgdir/usr/bin/webapp-creator"
}
