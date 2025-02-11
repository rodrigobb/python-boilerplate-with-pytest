# Python boilerplate

## Setup

```
git clone git@github.com:rodrigobb/python-boilerplate-with-pytest.git .
docker build -t python-dev .
```

## Develop

```
docker run --volume ./src:/code/src --name python-dev python-dev
```

or probably better detached and exposing a PORT if it's a web app:

```
docker run -d --volume ./src:/code/src --name python-dev -p 8000:8000 python-dev
```

Next time, you only need to start the container (attached or not):
```
docker start -a python-dev
```

## Tests (automated + watch)

To run the tests:

```
docker run --volume ./src:/code/src --volume ./tests:/code/tests --name python-dev-tests python-dev /usr/local/bin/poetry run pytest
```

And later just start and stop the container (attached to see the output)
```
docker start -a python-dev-tests
```

To keep the source code watched and run the tests automatically after modifications:

```
docker run --volume ./src:/code/src --volume ./tests:/code/tests --name python-dev-watch python-dev /usr/local/bin/poetry run ptw
```

or

```
docker start -a python-dev-watch
```
