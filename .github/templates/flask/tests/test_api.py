from decimal import Decimal


def test_products_get_all(client, products):  # Arrange
    """Test get all products"""
    # Act
    response = client.get("/api/v1/product/")
    # Assert
    assert response.status_code == 200
    data = response.json["products"]
    assert len(data) == 3
    for product in products:
        assert product.id in [item["id"] for item in data]
        assert product.name in [item["name"] for item in data]
        assert product.price in [Decimal(item["price"]) for item in data]


def test_products_get_one(client, products):  # Arrange
    """Test get all products"""
    for product in products:
        # Act
        response = client.get(f"/api/v1/product/{product.id}")
        data = response.json
        # Assert
        assert response.status_code == 200
        assert data["name"] == product.name
        assert Decimal(data["price"]) == product.price
        assert data["description"] == product.description
