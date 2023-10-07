if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/LongForecasting" ]; then
    mkdir ./logs/LongForecasting
fi

model_name=PatchTST
root_path_name=./dataset/
data_path_name=ETTh1.csv
model_id_name=ETTh1
data_name=ETTh1

random_seed=2021

seq_len=336
for pred_len in 96 192
do
  python -u run_longExp.py \
    --random_seed 2021 \
    --is_training 1 \
    --root_path ./dataset/ \
    --data_path ETTh1.csv \
    --model_id ETTh1'_'$seq_len'_'$pred_len \
    --model PatchTST \
    --data ETTh1 \
    --features M \
    --seq_len $seq_len \
    --pred_len $pred_len \
    --enc_in 7 \
    --e_layers 3 \
    --n_heads 4 \
    --d_model 16 \
    --d_ff 128 \
    --dropout 0.3 \
    --period 24\
    --persevere 96\
    --patch_len 1\
    --stride 1\
    --des Exp \
    --pct_start 0.2 \
    --train_epochs 100 \
    --patience 20 \
    --itr 1 --batch_size 128 --learning_rate 0.0001 >logs/LongForecasting/$model_name'_'$model_id_name'_wo_period_enhance_'$seq_len'_'$pred_len.log
done

for pred_len in 336 720
do
  python -u run_longExp.py \
    --random_seed 2021 \
    --is_training 1 \
    --root_path ./dataset/ \
    --data_path ETTh1.csv \
    --model_id ETTh1'_'$seq_len'_'$pred_len \
    --model PatchTST \
    --data ETTh1 \
    --features M \
    --seq_len $seq_len \
    --pred_len $pred_len \
    --enc_in 7 \
    --e_layers 3 \
    --n_heads 4 \
    --d_model 16 \
    --d_ff 128 \
    --dropout 0.3 \
    --period 24\
    --persevere 0\
    --patch_len 1\
    --stride 1\
    --des Exp \
    --pct_start 0.2 \
    --train_epochs 100 \
    --patience 20 \
    --itr 1 --batch_size 128 --learning_rate 0.0001 >logs/LongForecasting/$model_name'_'$model_id_name'_wo_period_enhance_'$seq_len'_'$pred_len.log
done