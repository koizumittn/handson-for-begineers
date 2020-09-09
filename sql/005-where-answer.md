# ステップ5：条件に一致する行を抽出する(回答)

1. visitテーブルのrankカラムの値が5であるレコードを抽出してみましょう。  

```sql
SELECT * FROM visit WHERE rank = 5;
```

2. shopテーブルよりlocationカラムが「東京」かつsalesカラムの値が200よりも大きいレコードを抽出してみましょう。  
さらに、表示するカラムをname, location, salesに絞り込んでください。  

```sql
SELECT name, location, sales FROM shop WHERE location = '東京' AND sales > 200;
```

次のステップ：[並び替えと制限](006-sort-and-limit.md)  
問題のページに戻る：[条件に一致する行を抽出する](005-where.md)  
[目次に戻る](README.md)
