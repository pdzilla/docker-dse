FROM azul/zulu-openjdk:8u40
MAINTAINER  Patrick DAVIS <okipatrick@gmail.com>
LABEL dockerfile_version=0.2.1 modified_date=07-16-2015


ENV DSE_USER DSE_PW 
ENV DSE_VERSION="4.7.2-1"

# DSE install requires visudo to work and requires sudoers to exist
RUN echo "deb http://$DSE_USER:$DSE_PW@debian.datastax.com/enterprise stable main" | tee -a /etc/apt/sources.list.d/datastax.sources.list \
	&& apt-get update \
	&& apt-get install -y curl \
	&& curl -L https://debian.datastax.com/debian/repo_key | apt-key add - \
	&& apt-get update \
	&& apt-get install -y vim sudo \
	&& touch /etc/sudoers \
	&& apt-get install -y dse-full=$DSE_VERSION

EXPOSE 7199 9160
CMD ["dse", "cassandra", "-f"]

