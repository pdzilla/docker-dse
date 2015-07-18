dse
===

# Summary
At present, just a Dockerfile that can be used to build a DataStax Enterprise image.  In order to actually build the image, you'll need an account with DataStax.

# Usage
Until Docker supports build-time environment variable injection, this Dockerfile is incomplete. You'll need to pull the file and add your DataStax login to the DSE\_USER and DSE\_PW variables, then build the file with something like:

``` bash
docker build --rm -t dse:<version> .
```

As a general guideline, when running the built container, you probably want to inject your `cassandra.yaml` file to `/etc/dse/cassandra/cassandra.yaml`, and probably want to idenfity some storage volume(s) or storage container to persist data.


# Contributing
If you want to contribute, please submit a PR.