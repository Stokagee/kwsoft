FROM marketsquare/robotframework-browser:18.3.0

WORKDIR /opt/robotframework

COPY requirements.txt .

RUN pip install --no-cache-dir --upgrade pip

RUN pip install --no-cache-dir -r requirements.txt

RUN rfbrowser init