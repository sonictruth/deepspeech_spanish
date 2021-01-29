docker run --network host --rm -it --gpus all --privileged --shm-size=1g \
--ulimit memlock=-1 --ulimit stack=67108864 \
--volume `pwd`/scripts:/DeepSpeech/es_scripts/ \
--volume  /mnt/hdd:/DeepSpeech/es_work/ \
mozilla_deepspeech_spanish bash
