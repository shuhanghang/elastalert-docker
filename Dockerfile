FROM python:3.6-alpine

ARG ELASTALERT_VERSION
ARG ELASTALERT_HOME=/opt/elastalert-$ELASTALERT_VERSION

WORKDIR /opt
RUN apk add --update --no-cache ca-certificates openssl-dev openssl gcc libffi-dev gcc musl-dev && \
    pip install elastalert 
ADD https://github.com/Yelp/elastalert/archive/v$ELASTALERT_VERSION.tar.gz /opt/
RUN tar -xf v$ELASTALERT_VERSION.tar.gz  && rm -rf v$ELASTALERT_VERSION.tar.gz

WORKDIR $ELASTALERT_HOME
RUN sed -i s/"jira>=1.0.10,<1.0.15"/"jira>=2.0.0"/g requirements.txt && \
    pip install "setuptools>=11.3" && \
    python ./setup.py install && \
    pip install -r ./requirements.txt
COPY ./entrypoint.sh $ELASTALERT_HOME/
CMD ["sh","-c","sh entrypoint.sh"]