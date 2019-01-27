FROM alpine:3.8
RUN apk add --no-cache --update grep bash curl docker make jq git 
RUN curl -s https://raw.githubusercontent.com/zaquestion/lab/master/install.sh | bash
