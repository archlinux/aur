# Maintainer: Fabio Sussarellu <sussarellu.fabio@gmail.com>
pkgname=sqlines-sql-converter
pkgver=3.1.173
pkgrel=1
pkgdesc='SQLines SQL Converter is an open source tool that helps you convert database schema (DDL), queries and DML statements, views, stored procedures, packages, functions and triggers.'
arch=('x86_64')
url='http://www.sqlines.com/'
license=('APACHE')
depends=('linux')
source=("http://www.sqlines.com/downloads/sqlines31173_x86_64_linux.tar.gz")
sha512sums=('a240d24bffdee46fc6ff38b4394047321f1f3aac677bc6be7fd897fe231b5291062befe74b0028bd6a7c3fdf5bb428b68fd7b653c417a3574f0e75949ff69ec2')

package() {
	folder="sqlines31173_x86_64_linux"
	filename="$folder".tar.gz
	cd $srcdir
	tar xzf "$filename"
	mkdir -p $pkgdir/usr/bin
	install "$folder"/sqlines $pkgdir/usr/bin/sqlines
}
