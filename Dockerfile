FROM python:3.10-bullseye

WORKDIR /app

RUN python -m venv ./.venv

COPY ./requirements/backend.in /app/requirements.txt

RUN ./.venv/bin/pip install --upgrade pip && ./.venv/bin/pip install -r requirements.txt

COPY . .

CMD [".venv/bin/uvicorn", "spaceship.main:app", "--host=0.0.0.0", "--port=8080"]
