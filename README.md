https://docs.aws.amazon.com/de_de/cli/latest/userguide/cli-configure-envvars.html

```
Set following environment variables:

S3='s3://mybucket/'
PGHOST='localhost:5432'
PGDATABASE='postgres'
PGUSER='postgres@postgres'
PGPASSWORD='password'
FILENAME='file' # the filename of the dumpfile

Copy dump from s3 to container and restore file

```
