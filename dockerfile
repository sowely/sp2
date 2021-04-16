#FROM ubuntu
COPY sp2.s .
RUN apt update
RUN apt install gcc -y
RUN apt install lib32z-dev -y
RUN gcc -m32 sp2.s -o sp2
}