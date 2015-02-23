import os
from setuptools import setup, find_packages

setup(
    name='foo.bar.demo',
    version='0.1',
    description="Demonstrate error",
    install_requires=['setuptools'],
    zip_safe=True,
    package_dir={'': 'src'},
    namespace_packages=['ns'],
    packages=find_packages(where='src', exclude=[]),
)

