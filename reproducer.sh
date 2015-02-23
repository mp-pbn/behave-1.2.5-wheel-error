#!/bin/bash

package_format="$1"

prepare_virtualenv() {
	rm -rf .env
	virtualenv --system-site-packages .env
	source .env/bin/activate
}

case "$package_format" in
wheel)
	prepare_virtualenv
	pip install https://pypi.python.org/packages/py2.py3/b/behave/behave-1.2.5-py2.py3-none-any.whl#md5=1cb1f8b925fa215926748b63e420d086
	echo "################################################################################"
	echo "Installed behave-1.2.5 wheel"
	echo "################################################################################"
	;;
sdist)
	prepare_virtualenv
	pip install https://pypi.python.org/packages/source/b/behave/behave-1.2.5.tar.gz#md5=3af4bc2886d2be982e41bfaba61da3bc
	echo "################################################################################"
	echo "Installed behave-1.2.5 sdist"
	echo "################################################################################"
	;;
*)
	echo "Usage: reproducer <package format>"
	echo "   <package_format>	wheel | sdist"
	echo ""
	echo "To demonstrate the bug, use ./reproducer wheel"
	exit 1
esac

# install dependent package
pip install ./other


pip install -e ./demo
behave demo/features

case "$package_format" in
wheel)
	echo "behave with the wheel package should have failed"
	;;
sdist)
	echo "behave with the sdist package should have worked"
	;;
esac


