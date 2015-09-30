NAME =			redis
VERSION =		latest
VERSION_ALIASES =	
TITLE =			Redis
DESCRIPTION =		Redis
SOURCE_URL =		https://github.com/scaleway-community/scaleway-redis
VENDOR_URL =		http://redis.io

IMAGE_VOLUME_SIZE =     50G
IMAGE_BOOTSCRIPT =      stable
IMAGE_NAME =            Redis


## Image tools  (https://github.com/scaleway/image-tools)
all:	docker-rules.mk
docker-rules.mk:
	wget -qO - http://j.mp/scw-builder | bash
-include docker-rules.mk
