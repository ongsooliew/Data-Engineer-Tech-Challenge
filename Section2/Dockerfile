FROM postgres
ENV POSTGRES_USER docker
ENV POSTGRES_PASSWORD docker
ENV POSTGRES_DB postgres
ADD sql/tables/init.sql /docker-entrypoint-initdb.d/
RUN chown 777 /docker-entrypoint-initdb.d/init.sql

