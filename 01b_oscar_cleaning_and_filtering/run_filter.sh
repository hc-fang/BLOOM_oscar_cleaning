lan=zh
split=train
num_proc=8
data_files="data/*.txt"
output_dir=dataset_filtered


python main_filtering.py \
    --split $split \
    --lang_dataset_id $lan \
    --data_files $data_files \
    --path_sentencepiece_model ac_dc/$lan.sp.model \
    --path_kenlm_model ac_dc/$lan.arpa.bin \
    --num_proc $num_proc \
    --path_dir_save_dataset $output_dir \
    --print_examples