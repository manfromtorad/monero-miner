FROM ubuntu:16.04

WORKDIR /app
USER root

RUN apt -y update

RUN apt install -y ocl-icd-opencl-dev

RUN apt-get install -y g++ cmake git

RUN git clone http://github.com/bogdanadnan/ariominer.git

RUN cd ariominer && mkdir build && cd build && cmake .. && make

CMD ./ariominer --mode miner --pool http://aropool.com/ --wallet WX6yZDxTA2zjsanhbp6NePR9ZiWsnupWikADkdughNm7XM25DkQ1tZt596VAnayo4NicmjVCbaFPempcAtCiyp5 --name worker --cpu-intensity 100 -g 0 -v
