if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/LongForecasting" ]; then
    mkdir ./logs/LongForecasting
fi
seq_len=336
model_name=PatchTST

root_path_name=./dataset/
data_path_name=weather.csv
model_id_name=weather
data_name=custom
random_seed=2021

for pred_len in 96 192 336 720
do
    CUDA_VISIBLE_DEVICES=1 \
    python -u run_longExp.py \
      --random_seed $random_seed \
      --is_training 1 \
      --root_path $root_path_name \
      --data_path $data_path_name \
      --model_id $model_id_name_$seq_len'_'$pred_len \
      --model $model_name \
      --data $data_name \
      --features M \
      --seq_len $seq_len \
      --pred_len $pred_len \
      --enc_in 21 \
      --e_layers 3 \
      --n_heads 16 \
      --d_model 128 \
      --d_ff 256 \
      --dropout 0.3\
      --persevere 0\
      --period_mean\
      --period 336 67 48 \
      --patch_len 16 3 2 \
      --stride 16 3 2\
      --des 'Exp'\
      --train_epochs 100\
      --patience 10\
      --pct_start 0.2\
      --itr 1 --batch_size 128 --learning_rate 0.0001 >logs/LongForecasting/$model_name'_'$model_id_name'_'$seq_len'_'$pred_len.log
done