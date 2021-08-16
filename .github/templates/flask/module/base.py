from flask import Flask
from dynaconf import FlaskDynaconf


def create_app():
    app = Flask(__name__)
    FlaskDynaconf(app)  # config managed by Dynaconf
    app.config.load_extensions(
        "EXTENSIONS"
    )  # Load extensions from settings.toml
    return app
