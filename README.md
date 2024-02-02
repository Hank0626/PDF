# Periodicity Decoupling Framework for Long-term Series Forecasting

This is an official implementation of [Periodicity Decoupling Framework for Long-term Series Forecasting](https://openreview.net/pdf?id=dp27P5HBBt).

## 📰 News

- [2024-01-15] 🎉 Our paper has been accepted by ICLR 2024.

## 🛠 Prerequisites

Ensure you are using Python 3.9 and install the necessary dependencies by running:

```
pip install -r requirements.txt
```

## 📊 Prepare Datastes

Begin by downloading the required datasets. All datasets are conveniently available at [Autoformer](https://drive.google.com/drive/folders/1ZOYpTUa82_jCcxIdTmyr0LXQfvaM9vIy). Create a separate folder named `./dataset` and neatly organize all the csv files as shown below:
```
dataset
├── electricity
│   └── electricity.csv
├── ETT-small
│   ├── ETTh1.csv
│   ├── ETTh2.csv
│   ├── ETTm1.csv
│   └── ETTm2.csv
├── traffic
│   └── traffic.csv
└── weather
    └── weather.csv
```

## 💻 Training

All scripts are located in `./scripts/PDF`. Choose from two historical input lengths: 336 and 720. For instance, to train a model using the ETTh2 dataset with an input length of 720, simply run:

```shell
sh ./scripts/PDF/720/ETTh2.sh
```

After training:

- Your trained model will be safely stored in `./checkpoints`.
- Visualization outputs are available in `./test_results`.
- Numerical results in .npy format can be found in `./results`.
- A comprehensive summary of quantitative metrics is accessible in `./results.txt`.

## 📚 Citation
If you find this repo useful, please consider citing our paper as follows:
```
@article{liu2023wftnet,
  title={Periodicity Decoupling Framework for Long-term Series Forecasting},
  author={Dai, Tao and Wu, Beiliang and Liu, Peiyuan and Li, Naiqi and Bao, Jigang and Jiang, Yong and Xia, Shu-Tao},
  journal={International Conference on Learning Representations},
  year={2024}
}
```

## 🙏 Acknowledgement
Special thanks to the following repositories for their invaluable code and datasets:

- [https://github.com/thuml/Autoformer](https://github.com/thuml/Autoformer)
- [https://github.com/yuqinie98/PatchTST](https://github.com/yuqinie98/PatchTST)
- [https://github.com/MAZiqing/FEDformer](https://github.com/MAZiqing/FEDformer)

## 📩 Contact
If you have any questions, please contact [lpy23@mails.tsinghua.edu.cn](lpy23@mails.tsinghua.edu.cn) or submit an issue.
