
# golang:onbuild automatically copies the package source, 
# fetches the application dependencies, builds the program, 
# and configures it to run on startup
FROM debian:jessie

EXPOSE 9090

LABEL Name=darling Version=0.0.1

#切换更新源
RUN mv /etc/apt/sources.list /etc/apt/sources.bak && \
    echo "deb http://mirrors.aliyun.com/debian wheezy main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb-src http://mirrors.aliyun.com/debian wheezy main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb http://mirrors.aliyun.com/debian wheezy-updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb-src http://mirrors.aliyun.com/debian wheezy-updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb http://mirrors.aliyun.com/debian-security wheezy/updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb-src http://mirrors.aliyun.com/debian-security wheezy/updates main contrib non-free" >> /etc/apt/sources.list

RUN mkdir /darling && \
    mkdir /darling/log
#安装ffmpeg

#设置时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ADD view /darling/view
ADD darling_linux_amd64 /darling


RUN apt-get install

WORKDIR /darling
ENTRYPOINT ["/darling/darling_linux_amd64"]
# CMD ["/app/app_linux_amd64"]
#CMD ["/bin/bash"]