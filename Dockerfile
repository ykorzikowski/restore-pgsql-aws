FROM alpine:3.9

ENV S3='s3://mybucket/'
ENV PGHOST='localhost:5432'
ENV PGDATABASE='postgres'
ENV PGUSER='postgres@postgres'
ENV PGPASSWORD='password'
ENV FILENAME=''

ENV AWSCLI_VERSION "1.14.10"

RUN apk add --update \
    postgresql \
    curl \
    bash \
    python \
    python-dev \
    py-pip \
    build-base \
    && pip install awscli==$AWSCLI_VERSION --upgrade \
    && apk --purge -v del py-pip \
    && rm -rf /var/cache/apk/*

RUN mkdir /app /pg_backup

WORKDIR /app

COPY ./restore.sh .

RUN chmod 755 restore.sh

CMD [ "./restore.sh" ]
