from flask import abort, render_template
from project_name.models import Product


def index():
    products = Product.query.all()
    return render_template("index.html", products=products)


def product(product_id):
    product = Product.query.filter_by(id=product_id).first() or abort(
        404, "produto nao encontrado"
    )
    return render_template("product.html", product=product)
