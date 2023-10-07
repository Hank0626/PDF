if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/LongForecasting" ]; then
    mkdir ./logs/LongForecasting
fi

model_name=PDF
root_path_name=./dataset/
data_path_name=ETTm1.csv
model_id_name=ETTm1
data_name=ETTm1

random_seed=2021

seq_len=720

for pred_len in 96 192 336
do
  CUDA_VISIBLE_DEVICES=0\
  python -u run_longExp.py \
    --random_seed 2021 \
    --is_training 1 \
    --root_path ./dataset/ \
    --data_path ETTm1.csv \
    --model_id ETTm1'_'$seq_len'_'$pred_len \
    --model PDF \
    --data ETTm1 \
    --features S \
    --seq_len $seq_len \
    --pred_len $pred_len \
    --enc_in 1 \
    --e_layers 3 \
    --n_heads 16 \
    --d_model 48 \
    --d_ff 48 \
    --dropout 0.5 \
    --fc_dropout 0.25 \
    --kernel_list 5 7 11 15 \
    --period 48 90 102 360 720 \
    --patch_len 3 6 16 32 48 \
    --stride 3 6 16 32 48 \
    --des Exp \
    --lradj 'TST' \
    --train_epochs 100 \
    --patience 20 \
    --itr 1 --batch_size 128 --learning_rate 0.0001 >logs/LongForecasting/$model_name'_'$model_id_name'_'$seq_len'_'$pred_len.log
done

for pred_len in 720
do
  CUDA_VISIBLE_DEVICES=0\
  python -u run_longExp.py \
    --random_seed 2021 \
    --is_training 1 \
    --root_path ./dataset/ \
    --data_path ETTm1.csv \
    --model_id ETTm1'_'$seq_len'_'$pred_len \
    --model PDF \
    --data ETTm1 \
    --features S \
    --seq_len $seq_len \
    --pred_len $pred_len \
    --enc_in 1 \
    --e_layers 3 \
    --n_heads 16 \
    --d_model 48 \
    --d_ff 48 \
    --dropout 0.5 \
    --fc_dropout 0.25 \
    --kernel_list 5 7 11 15 \
    --period 48 90 102 360 720 \
    --patch_len 4 6 16 32 48 \
    --stride 4 6 16 32 48 \
    --des Exp \
    --lradj 'TST' \
    --train_epochs 100 \
    --patience 20 \
    --itr 1 --batch_size 128 --learning_rate 0.00005 >logs/LongForecasting/$model_name'_'$model_id_name'_'$seq_len'_'$pred_len.log
done