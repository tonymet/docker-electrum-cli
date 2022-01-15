# Electrum CLI Image

A lightweight docker image for Electrum CLI


## Example Cmds

```
0 t="--testnet"
1 electrum $t daemon&
2 electrum $t load_wallet
3 electrum $t list_wallet
4 electrum $t list_wallets
5 electrum $t listaddresses
6 electrum $t listtransactions
7 electrum $t list_transactions
8 electrum --help|grep trans
9 electrum --help|grep balance
10 electrum $t getbalance
11 history
```
