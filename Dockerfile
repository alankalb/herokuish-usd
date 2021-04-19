FROM gliderlabs/herokuish:v0.5.24-20
WORKDIR /app
RUN git clone https://github.com/PixarAnimationStudios/USD usdsrc && \
	  cd usdsrc && git checkout tags/v21.02 && cd ../ && \
	  python usdsrc/build_scripts/build_usd.py -v --no-imaging  --no-examples --no-tutorials /app/usd && \
		rm -rf usdsrc
RUN apt-get update && apt-get install -y --no-install-recommends \
    nasm \
    python3-pip
RUN pip3 install Pillow
ARG CACHEBUST=3
RUN git clone https://github.com/alankalb/usd_from_gltf.git ufgsrc
RUN python ufgsrc/tools/ufginstall/ufginstall.py /app/ufg /app/usd
RUN	rm -rf ufgsrc