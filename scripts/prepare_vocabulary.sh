python prepare_vocabulary.py --training_csv ../es_work/es_out/all.csv ../es_work/es_out/vocab.txt
python3 /DeepSpeech/data/lm/generate_lm.py --input_txt ../es_work/es_out/vocab.txt --output_dir ../es_work/es_out/  \
    --top_k 500000 --kenlm_bins /DeepSpeech/native_client/kenlm/build/bin/ --arpa_order 5 --max_arpa_memory "85%" \
     --arpa_prune "0|0|1" --binary_a_bits 255 --binary_q_bits 8 --binary_type trie --discount_fallback

ARCH=${1:-cpu}
python /DeepSpeech/util/taskcluster.py --target DeepSpeechNativeClient --arch "${ARCH}"
DeepSpeechNativeClient/generate_scorer_package --alphabet alphabet_es.txt --lm ../es_work/es_out/lm.binary --vocab ../es_work/es_out/vocab-500000.txt \
  --package ../es_work/es_out/kenlm.scorer --default_alpha 0.749166959347089 --default_beta 1.6627453128820517

