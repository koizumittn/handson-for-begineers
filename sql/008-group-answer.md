# ステップ8：グループ化(回答)

1. visitテーブルより評価(rankカラム、1〜5の値)ごとの件数を求めましょう。  

```sql
SELECT rank AS 評価, COUNT(*) AS 件数 FROM visit GROUP BY rank;
```

評価(rankカラム)でグループ化します。  
そしてCOUNT関数を使用して、評価ごとの件数をカウントします。  

2. userテーブルより男性、女性それぞれの年齢(ageカラム)から最大値を求めましょう。    

```sql
SELECT sex AS 性別, MAX(age) AS 最大年齢 FROM user GROUP BY sex;
```

性別(sexカラム)でグループ化します。  
そしてMAX関数を使用して、性別ごとの最大年齢を求めます。  

次のステップ：[テーブルの結合](009-join.md)  
問題のページに戻る：[グループ化](008-group.md)  
[目次に戻る](README.md)
