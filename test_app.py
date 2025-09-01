import pytest
from app import app

@pytest.fixture
def client():
    app.testing = True
    with app.test_client() as c:
        yield c

def test_home_returns_200_and_message(client):
    resp = client.get("/")
    assert resp.status_code == 200
    assert b"Hello from Flask in Docker!" in resp.data

def test_health_returns_ok(client):
    resp = client.get("/health")
    assert resp.status_code == 200
    assert resp.is_json
    assert resp.get_json()["status"] == "ok"
