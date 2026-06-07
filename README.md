# Credit Card Fraud Detection

Analýza 284 807 kreditních transakcí zaměřená na detekci anomálií a podezřelých vzorů.

## Cíl projektu
Identifikovat fraudové transakce pomocí exploratní analýzy a SQL dotazů — 
přístup obdobný práci forenzního analytika.

## Klíčové zjištění
- Fraud tvoří pouze 0.17 % všech transakcí (492 z 284 807)
- Průměrná fraudová transakce: 122 USD vs. 88 USD u normálních
- Nejvyšší fraud rate u transakcí **pod 10 USD** (0.256%) — typické testování karty
- Nejvyšší fraud rate u transakcí **nad 1000 USD** (0.293%)
- Největší transakce (25 000+ USD) jsou všechny normální

## Technologie
- Python (pandas, matplotlib, seaborn, DuckDB)
- SQL (window functions, Z-score analýza)
- Jupyter Notebook
- GitHub

## Dataset
[Credit Card Fraud Detection - Kaggle (mlg-ulb)](https://www.kaggle.com/datasets/mlg-ulb/creditcardfraud)  
Dataset není součástí repozitáře kvůli velikosti (150 MB). Stáhni ho z Kaggle a ulož do složky `data/`.

## Struktura projektu
fraud-detection/
├── notebooks/
│   └── 01_exploratory_analysis.ipynb
├── sql/
│   └── anomaly_queries.sql
└── README.md

## Spuštění
pip install pandas matplotlib seaborn duckdb notebook
jupyter notebook notebooks/01_exploratory_analysis.ipynb
