# ステップ6：並び替えと制限(回答)

1. visitテーブルにおける評価(rankカラム)の平均値を求めましょう。  
また、AS句を使用して「平均評価」という別名を付けて表示させましょう。  

```sql
SELECT AVG(rank) AS 平均評価 FROM visit;
```

2. userテーブルに登録されているユーザデータから30代のユーザの人数を求めてみましょう。  
年齢はageカラムに格納されています。  
また、AS句を使用して「30代ユーザーの人数」という別名を付けて表示させましょう。  

```sql
SELECT COUNT(*) AS 30代ユーザーの人数 FROM user WHERE age BETWEEN 30 AND 39;
```

次のステップ：[グループ化](008-group.md)  
問題のページに戻る：[集計関数](007-aggregation.md)  
[目次に戻る](README.md)
