import pytest

from project_name import BaseClass, base_function

given = pytest.mark.parametrize


@given("fn", [BaseClass(), base_function])
def test_parameterized(fn):
    assert "hello from" in fn()


def test_base_function():
    assert base_function() == "hello from base function"


def test_base_class():
    assert BaseClass().base_method() == "hello from BaseClass"
