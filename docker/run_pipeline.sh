#!/bin/sh
set -e

if [ -f train_data.csv ] && [ -f trade_data.csv ]; then
    echo "=== Step 1: train_data.csv / trade_data.csv already exist, skipping data download ==="
else
    echo "=== Step 1: downloading & preprocessing data ==="
    python examples/FinRL_StockTrading_2026_1_data.py
fi

echo "=== Step 2: training agents (already-trained agents are skipped individually) ==="
python examples/FinRL_StockTrading_2026_2_train.py

if [ -f backtest_result.png ]; then
    echo "=== Step 3: backtest_result.png already exists, skipping backtest ==="
else
    echo "=== Step 3: backtesting ==="
    python examples/FinRL_StockTrading_2026_3_Backtest.py
fi
