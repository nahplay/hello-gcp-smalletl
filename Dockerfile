FROM python:3.9

RUN mkdir /app

WORKDIR /app

COPY . /app

RUN pip install -r requirements.txt

ENTRYPOINT ["python", "main.py"]