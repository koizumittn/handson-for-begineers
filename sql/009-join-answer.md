# ステップ9：テーブルの結合(回答)

1. visitテーブルから最もユーザーの訪問数が多い店舗を求めましょう。  

```sql
SELECT
    shop_id AS 店舗ID,
    COUNT(*) AS 訪問数
FROM
    visit
GROUP BY
    shop_id
ORDER BY
    訪問数 DESC;
```

SQLの実行結果から訪問数は最も多いのは店舗ID6のラーメン店だとわかります。(訪問数16)  

2. 1で求めた店舗に訪問したユーザの氏名と年齢を訪問IDと合わせて表示させてみましょう。  

```sql
SELECT
    visit.id AS 訪問ID,
    user.name AS ユーザー氏名,
    user.age AS 年齢
FROM
    visit
JOIN
    user
ON
    visit.user_id = user.id
WHERE
    visit.shop_id = 6;
```

visitテーブルにuserテーブルを結合し、ユーザー氏名と年齢のカラムを抽出します。  
また、1で求められた店舗ID6のラーメン店のデータに絞るため、WHERE句でshop_id = 6を指定します。  

問題のページに戻る：[テーブルの結合](009-join.md)  
[目次に戻る](README.md)
