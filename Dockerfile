FROM python:3.9


RUN pip install poetry

COPY . /qr
WORKDIR /qr

RUN poetry install

CMD ["sleep", "infinity"]
