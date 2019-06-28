FROM linuxserver/qbittorrent:amd64-latest as builder

RUN apt-get update && apt-get upgrade --yes \
	apt-get install --yes python3 python3-pip python3-venv && \
	update-alternatives --install /usr/bin/python python /usr/bin/python2 100 && \
	update-alternatives --install /usr/bin/python python /usr/bin/python3 150 && \
	ln -s /usr/bin/pip3 /bin/pip && \
	pip install autoremove-torrents && \
	pip install flexget && \
	apt-get clean && \
	rm -rf \
		/tmp/* \
		/var/lib/apt/lists/* \
		/var/tmp/*
