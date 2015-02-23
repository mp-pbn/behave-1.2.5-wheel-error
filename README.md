Demonstrate a problem with the behave-1.2.5 wheel package from pypi.

In here are two python packages using namespace 'ns'. The behave-1.2.5 wheel
package has problems with importing namespace packages into the steps when the
namespace package itself imports a different package with the same namespace.

This can be reproduced via

  ./reproducer.sh wheel   # this one shows the problem with the wheel package from pypi

  ./reproducer.sh sdist   # this one uses the sdist package from pypi and works

It creates a virtualenv in .env and either installs the wheel or the sdist package
from pypi, depending on the parameter given to the script.
