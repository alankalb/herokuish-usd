FROM gliderlabs/herokuish:v0.5.24-20
WORKDIR /app
RUN git clone https://github.com/PixarAnimationStudios/USD usdsrc && \
	  cd usdsrc && git checkout tags/v21.02 && cd ../ && \
	  python usdsrc/build_scripts/build_usd.py -v --no-imaging  --no-examples --no-tutorials /app/usd && \
		rm -rf usdsrc