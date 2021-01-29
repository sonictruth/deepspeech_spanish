## DeepSpeech Spanish Model Trainer
This is a collection of scripts to train spanish model for Mozilla Deepspeech using a Nvidia Tensorflow GPU Docker container.

1. Run `./build_docker.sh`
2. Replace `/mnt/hdd` with `[/your/work/folder]` from  `./run_docker.sh`
3. Download Spanish Common Voice dataset from `https://commonvoice.mozilla.org/en/datasets` untar as `[/your/work/folder/]es`
4. Remove all the TSV files from `[/your/work/folder/]es` files except `train.tsv` `dev.tsv` `test.tsv`
5. Run `./run_docker.sh` 

#### Inside container
1. `cd es_scripts`
2. `./prepare_using_audiomate.py` This will convert all the Common Voice mp3's to wav and generate CSV from TSV the output will be in `[/your/work/folder/]es_out`
2. `./start_train.sh` (if you get character errors CSV files from might still need some manual cleaning)
