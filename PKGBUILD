pkgname=youtube-dl-mp4-git
pkgver=1.0
pkgrel=1
pkgdesc="MP4 alias for youtube-dl"
arch=('x86_64')
url="https://gitlab.com/azizyus/youtube-dl-mp4"
license=('MIT')
makedepends=('git')
depends=('glut' 'glu')
source=('git+https://gitlab.com/azizyus/youtube-dl-mp4.git')
md5sums=('SKIP')

pkgver() {
  cd youtube-dl-mp4
  git describe --long --tags  | cut -d- -f1
}

build() 
{
echo "test"
}

package() 
{
sudo cp youtube-dl-mp4/youtube-dl-mp4 /usr/local/bin/youtube-dl-mp4
}

