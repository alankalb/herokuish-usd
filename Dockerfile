FROM alankalb/herokuish-usd:heroku20-usd21.02-ufg-quant
WORKDIR /app
COPY . /app
RUN curl "https://github.com/gliderlabs/herokuish/releases/download/v0.5.24/herokuish_0.5.24_linux_x86_64.tgz" \
    --silent -L | tar -xzC /bin
RUN /bin/herokuish buildpack build
