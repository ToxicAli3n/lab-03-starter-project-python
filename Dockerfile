FROM python:3.10-bullseye

WORKDIR /app

RUN python -m venv ./.venv

RUN . ./.venv/bin/activate

COPY ./requirements/backend.in /app/requirements.txt

RUN pip install --upgrade pip && pip install -r requirements.txt

COPY build build

COPY spaceship spaceship

CMD ["uvicorn", "spaceship.main:app", "--host=0.0.0.0", "--port=8080"]