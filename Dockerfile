FROM python:3.10-bullseye

WORKDIR /app

RUN python -m venv ./.venv

RUN . ./.venv/bin/activate

COPY ./requirements/backend.in /app/requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

COPY . /app

EXPOSE 8080

CMD ["uvicorn", "spaceship.main:app", "--host=0.0.0.0", "--port=8080"]