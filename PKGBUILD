# Maintainer: Sean Greenslade <zootboysean@gmail.com>

pkgdesc='Utilities for building arch packages for ROS stacks.'
url=http://www.ros.org

pkgname='ros-build-tools'
pkgver='0.0.1'
arch=('i686' 'x86_64')
pkgrel=3
license=('BSD')
makedepends=()
depends=()

pkg_destination_dir="/usr/share/ros-build-tools"

source=('fix-python-scripts.sh'
    'stack-install-tools.sh'
    'create-arch-ros-package-legacy.sh'
    'PKGBUILD.rostemplate'
    'get_stack_dependencies.py'
    'generate_packages_makefile.py'
    'generate-python-patch.sh'
    'import_catkin_packages.py')

build() {
	return 0
}
package() {
    mkdir -p ${pkgdir}${pkg_destination_dir}
    for file in "${source[@]}"; do
        cp $file ${pkgdir}${pkg_destination_dir}/$file
    done
}

md5sums=('b2b4fd23abb8e9e7382ef9aeab2542f5'
         '79ae7fb600e116623a42631d15d66a87'
         'ac82eca7efc9f0ff7e8b976a83692868'
         'f3378832c3ba121f7c9e17dc43c8b1d4'
         'd257f7f20384e894b0431ee61068aa96'
         '563c9d1320a3a997db25d3087303dcfb'
         '8d6d7eb89a12c449497b209f1a06655b'
         '85fc98bd9df02afa0d8a27c01db78c66')
