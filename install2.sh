post_install() {
	echo "Bootstrapping python2 pip, setuptools and wheel.."
	python2 /usr/bin/get-pip2.py
}
