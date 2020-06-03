FROM alpine:3.6

ENV S3='s3://mybucket/'
ENV PGHOST='localhost:5432'
ENV PGDATABASE='postgres'
ENV PGUSER='postgres@postgres'
ENV PGPASSWORD='password'
ENV FILENAME=''

ENV AWSCLI_VERSION "1.14.10"

RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base \
    && pip install awscli==$AWSCLI_VERSION --upgrade --user \
    && apk --purge -v del py-pip \
    && rm -rf /var/cache/apk/*

COPY ./restore.sh .

CMD [ "./restore.sh" ]
