post_install() {
	local pkgver="$1"
	local major_version="${pkgver%%.*}"
	echo "pkgver=$pkgver"
	echo "major_version=$major_version"
	odbcinst -v -q -d -n "ODBC Driver $major_version for SQL Server" >/dev/null ||
		odbcinst -i -d -f "/opt/microsoft/msodbcsql$major_version/etc/odbcinst.ini"
}

pre_remove() {
	local pkgver="$1"
	local major_version="${pkgver%%.*}"
	odbcinst -v -u -d -n "ODBC Driver $major_version for SQL Server" >/dev/null
}

post_upgrade() {
	local new_pkgver="$1"
	local old_pkgver="$2"

	pre_remove "$new_pkgver"
	post_install "$old_pkgver"
}
