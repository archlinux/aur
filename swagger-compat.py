class Swagger:
    def __init__(self, *args, **kwargs):
        pass


def swag_from(*args, **kwargs):
    def decorator(func):
        return func

    return decorator