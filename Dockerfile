FROM python:3.13-alpine

RUN apk update --no-cache && apk upgrade --no-cache --available

WORKDIR /code

RUN pip install poetry

COPY pyproject.toml /code

COPY README.md /code

RUN poetry install

# Will be overriden in dev by mounted volumes
COPY src /code/src 
COPY tests /code/tests 

# EXPOSE 8000 # for FastAPI or web frameworks ;)

CMD ["poetry", "run", "python", "-m", "src.main"]