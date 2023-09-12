docker network create blog-network

# This command runs a Docker container named "db" with PostgreSQL, attaches it to the "blog-network," maps a volume for data storage, exposes port 5432, and sets environment variables for the database name and password.
# '\' is a line continuation character for multi-line command
docker run --name db \
    --network blog-network \
    -v db-data:/var/lib/postgresql/data \
    -p 5432:5432 \
    -e POSTGRES_DB=blogdemo \
    -e POSTGRES_PASSWORD=lmnop \
    -d postgres

#docker build -t docker -f ./Dockerfile-2 .Dockerfile-2


docker run --name app \
    -p 8080:8080 \
    --network blog-network \
    -e POSTGRES_HOST=db \
    -e POSTGRES_DB=blogdemo \
    -e POSTGRES_PASSWORD=lmnop \
    -d webapp:buildpack

