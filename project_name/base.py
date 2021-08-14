"""
project_name base module.

This is the principal module of the project_name project.
here you put your main classes and objects.

Example:

Create here your Flask application to be imported and
executed by the __main__ module.

add "flask" to the install_requires list on setup.py

run `make install` to install the project_name application.

Create a Flask factory here on this file:

    from flask import Flask

    def create_app():
        app = Flask(__name__)

        @app.route('/')
        def index():
            return 'Hello World from project_name!'

        return app

Go to __main__.py and change the code inside the main function.

    from .base import create_app

    def main():
        app = create_app()
        app.run()

Be creative! do whatever you want!
"""


class BaseClass:
    def base_method(self) -> str:
        """
        Base method.
        """
        return "hello from BaseClass"

    def __call__(self) -> str:
        return self.base_method()


def base_function() -> str:
    """
    Base function.
    """
    return "hello from base function"


# uncomment if you are creating a Flask application
# from flask import Flask


# def create_app():
#     app = Flask(__name__)

#     @app.route('/')
#     def index():
#         return 'Hello World from project_name!'

#     return app
