# ステップ3：テーブルのデータをすべて取得する
このステップでは指定したテーブルのデータをすべて取得するSQL文を学びます。

## SELECT文の基本構文
データを取得するためのSQLは**SELECT文**です。  
指定したテーブルのデータをすべて取得するには、以下のような構文となります。
```sql
SELECT * FROM <テーブル名>;
```
**\*(アスタリスク)**はすべての列のデータを取得することを意味します。(列の絞り込みは次のステップで扱います。)  
テーブルは**FROM句**の後ろに指定します。  

SQL文は**最後に;(セミコロン)を付ける**のがルールです。  
こちらも忘れないようにしましょう。  

それでは実際にSQL Fiddleにテーブルのデータを取得するSQL文を入力し、  
実行してみましょう。

## ハンズオン
shopテーブルのデータを取得します。  
以下のSQL文をコピーしSQL Fiddleの**SQLパネル(右側のパネル)**に貼り付け、**Run SQL**ボタンをクリックしてみましょう。  

**[3-1]shopテーブルのデータを取得**  
```sql
SELECT * FROM shop;
```

以下のようにshopテーブルのデータを得られます。  
![shopテーブルのデータ](https://user-images.githubusercontent.com/22129880/92419969-aa794f80-f1ab-11ea-91d4-baf492b53b14.png)

画像のようにshopテーブルのデータが表示されればOKです。  
このようにSELECT文を使用することでデータベースに格納されているデータを参照することができます。  

## 練習問題
1. userテーブルのデータを取得してみましょう  
2. visitテーブルのデータを取得してみましょう 

回答は[こちら](003-select-answer.md)  

## 補足
**SQLでは大文字・小文字の区別を行いません。**  
例えばshopテーブルのデータを取得するSQLは以下のように書いても正しく動作します。  
(よかったら実際に試してみてください)  

**[3-1a]shopテーブルのデータを取得(大文字・小文字が混在)**  
```sql
seleCT * fRom sHOp;
```

ただし、不規則に大文字・小文字が混在すると可読性が低下するため、  
SQL構文に関する句(SELECT、FROMなど)は大文字、テーブル名やカラム名などは小文字という、  
一般的な慣習に従うようにしましょう。  

前のステップ：[データの準備](002-data-preparation.md)  
次のステップ：[列を絞り込む](004-select-columns.md)  
[目次に戻る](README.md)