from src.main import hello_world
import pytest

def test_hello_world():
    response = hello_world()
    assert "Hello World!" == response