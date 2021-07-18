pkgname=ee
pkgver=1.5.2
pkgrel=1
pkgdesc="Easy Editor in FreeBSD"
url="https://cgit.freebsd.org/src-vendor/ee/"
arch=("x86_64")
source=("bin.tar.gz"
         "make.sh"
         "source.gz")
sha256sums=("75077b38261f10a29af9821db67836b6fee9e312c887ed95553c67bf817318b7"
            "e3181013d6078db97dca1215f92b666ef9a22382146a5633ad5b0590f33a745c"
            "15fd6c7f635d0bf725c7cf21a51b2afe0c07b243f94df71c32305b7e3684ed98")

package(){
  chmod +x ee
  mkdir -p $pkgdir/usr/local/bin
  cp ee $pkgdir/usr/local/bin/ee
  mkdir -p $pkgdir/usr/local/man/man1
  cp ee.1 $pkgdir/usr/local/man/man1/ee.1
  echo "The next text, translated from Chinese into English, may not be accurate."
  echo "I didn't use the source code and compile it . Because in Arch Linux, compilation does not work properly."
  echo "make.sh is its compilation script, I executed it on openSUSE Leap and got a binary file packaged into bin.tar.gz"
}

# Chinese: 接下来的文字从中文翻译成英文，可能不准确。
# Chinese: 我没有使用源代码并编译，因为在Arch Linux中，编译无法正常进行。
# Chinese: make.sh是它的编译脚本，我在openSUSE Leap上执行了它，并得到了二进制文件，打包成bin.tar.gz。
