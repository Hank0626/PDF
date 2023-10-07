if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/LongForecasting" ]; then
    mkdir ./logs/LongForecasting
fi

model_name=PDF
root_path_name=./dataset/
data_path_name=ETTh2.csv
model_id_name=ETTh2
data_name=ETTh2
random_seed=2021
seq_len=336

for pred_len in 96 192 336 720
do
  python -u run_longExp.py \
  --random_seed 2021 \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path ETTh2.csv \
  --model_id ETTh2'_'$seq_len'_'$pred_len \
  --model PDF \
  --data ETTh2 \
  --features M \
  --seq_len $seq_len \
  --pred_len $pred_len \
  --enc_in 7 \
  --e_layers 3 \
  --n_heads 4 \
  --d_model 16 \
  --d_ff 32 \
  --dropout 0.55 \
  --fc_dropout 0.25 \
  --kernel_list 3 7 9 11 \
  --period 24 84 336 \
  --patch_len 2 3 24 \
  --stride 2 3 24 \
  --des Exp \
  --train_epochs 100 \
  --patience 20 \
  --itr 1 --batch_size 128 --learning_rate 0.0001 >logs/LongForecasting/$model_name'_'$model_id_name'_'$seq_len'_'$pred_len.log
done