# from linuxserver/qbittorrent
###
# qBittorrent + autoremove-torrents + FlexGet
#add https://github.com/ausaki/subfinder

docker create \
  --name=qbittorrent \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -e UMASK_SET=022 \
  -e WEBUI_PORT=8080 \
  -p 6881:6881 \
  -p 6881:6881/udp \
  -p 8080:8080 \
  -p 5050:5050 \
  -v /path/to/appdata/config:/config \
  -v /path/to/downloads:/downloads \
  --restart unless-stopped \
  rabbired/qbittorrent

# jerrymakesjelly/autoremove-torrents
https://github.com/jerrymakesjelly/autoremove-torrents

docker exec "name" autoremove-torrents --confg="" --log=""

# FlexGet set

# make /path/to/appdata/config/flexget/config.yml

# set webui passwd

docker exec "name" flexget web passwd "passwd"

# stop flexget

docker exec "name" flexget daemon stop
