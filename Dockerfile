# Here we initialize and build our c file

FROM ubuntu:18.04 AS compile-image
RUN apt-get update
# Install gcc
RUN apt-get install -y --no-install-recommends gcc build-essential
WORKDIR /root
COPY hello.c .
# Build hello.c using gcc
RUN gcc -o helloworld hello.c



# Run next stage of our multi-stage Docker
FROM ubuntu:18.04 AS runtime-image
# Copy and run already build file
COPY --from=compile-image /root/helloworld .
CMD ["./helloworld"]
