# ステップ4：列を絞り込む(回答)

1. shopテーブルのnameカラム、salesカラムのデータを取得してみましょう  

```sql
SELECT name, sales FROM shop;
```

2. userテーブルのnameカラムのデータを取得し、「氏名」という別名を付けて表示させてみましょう  

```sql
SELECT name AS 氏名 FROM user;
```

次のステップ：[条件に一致する行を抽出する](005-where.md)  
問題のページに戻る：[列を絞り込む](004-select-columns.md)  
[目次に戻る](README.md)
