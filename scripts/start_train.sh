python3 ../DeepSpeech.py \
    --scorer ../es_work/es_out/kenlm.scorer \
    --train_files ../es_work/es_out/train.csv \
    --dev_files ../es_work/es_out/dev.csv \
    --test_files ../es_work/es_out/test.csv \
    --alphabet_config_path=alphabet_es.txt \
    --test_batch_size 36 --train_batch_size 24 --dev_batch_size 36 \
    --export_language "es-Latn-ES" --export_license "Apache-2.0" --export_model_name "DeepSpeech Spanish" \
    --epochs 10 \
    --learning_rate 0.0005 --dropout_rate 0.40 \
    --export_dir ../es_work/es_export -v 1 \
    --checkpoint_dir ../es_work/checkpoints --summary_dir ../es_work/summaries
    
