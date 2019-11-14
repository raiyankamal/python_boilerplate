import pytest

from .foo import *

testdata = [
    (None, 'FOO'),
    ([], 'FOO'),
    (1, 'FOO'),
]

@pytest.mark.parametrize("arg,expected", testdata)
def test_y(arg, expected):
    actual = foo(arg)
    assert actual == expected
