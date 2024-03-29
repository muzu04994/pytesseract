FROM python:3.9-slim-buster

RUN apt-get update
RUN apt-get -qq -y install tesseract-ocr
RUN apt-get -qq -y install libtesseract-dev
RUN apt-get install -y libgl1-mesa-glx



WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

CMD ["gunicorn", "app:app"]
