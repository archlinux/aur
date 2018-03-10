post_install() {
	echo "Bootstrapping python pip, setuptools and wheel.."
	python /usr/bin/get-pip.py
}
