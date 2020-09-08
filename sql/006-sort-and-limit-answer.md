# ステップ6：並び替えと制限(回答)

1. userテーブルのデータを年齢(ageカラムの値)が低い順にソートして取得してみましょう。  

```sql
SELECT * FROM user ORDER BY age ASC;
```
ASC句は省略しても構いません。

2. shopテーブルより売上(salesカラムの値)が高い順にソートし、上位5店舗のレコードのみ抽出してみましょう。  

```sql
SELECT * FROM shop ORDER BY sales DESC LIMIT 5;
```

降順のソートはDESC句を使用します。  
またLIMIT句を使用して表示件数を5つに制限します。

次のステップ：[集計関数](007-aggregation.md)  
問題のページに戻る：[並び替えと制限](006-sort-and-limit.md)  
[目次に戻る](README.md)
