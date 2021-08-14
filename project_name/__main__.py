from . import BaseClass, base_function  # pragma: no cover


def main() -> None:  # pragma: no cover
    """
    The main function executes on `python -m project_name`
    """
    print("Executing main function")
    base = BaseClass()
    print(base.base_method())
    print(base_function())
    print("End of main function")


if __name__ == "__main__":  # pragma: no cover
    main()
