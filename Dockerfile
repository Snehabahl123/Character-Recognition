FROM heroku/python

# Grab requirements.txt.
ADD ./requirements.txt /tmp/requirements.txt

# Install dependencies
RUN pip install -qr /tmp/requirements.txt

# Add our code
ADD ./
WORKDIR /

RUN pip install scikit-learn

CMD gunicorn --bind 0.0.0.0:$PORT wsgi
