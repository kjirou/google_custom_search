# Google Custom Search の調査


## Custom Search Element

- 使うAPIの名前は Custom Search Element
- 過去に何度か名前が変わっていて、過去のものは非推奨になってたり廃止されていたりする
- 公式マニュアル https://developers.google.com/custom-search/docs/element


## 設置手順

- まず、ここから https://www.google.com/cse/all カスタム検索IDを作る
  - 後で表示や検索結果調整のために使う、以後コントロールパネル（コンパネ）と呼ぶ
- 後はHTMLにコードを貼り付けて置くだけ
  - 例 http://googlecustomsearch.appspot.com/elementv2/full-width_v2.html
  - ちなみに、自分で初期設定のまま作ったIDを設置すると検索結果がオーバーレイ表示になるが、それは コンパネ＞検索機能＞レイアウト から変更できる


## 特定のディレクトリ以下を検索対象にできるか？

as_sitesearch 属性で設定する。

```
<gcse:search as_sitesearch="kray.jp/blog/"></gcse:search>
```

しかし、このオプションはマニュアル上だと `Restrict results to pages from a specific site.` としか書いおらず、
記述例もドメインまでしか書いてない。

ディレクトリまで含むのが仕様なのかが不明。


## 見た目の自由度について

対応パターンの例

- CSSで修正
  - 検索結果HTML要素のIDが `___gcse_0` なので、それ以下を修正する
- コンパネから修正
  - 検索結果データに関する設定はここで行う。サムネイルON/OFFやソート順など
- フルカスタマイズ
  - 出来るみたい.. たが、ビジネスアカウントが必要で、システムからXMLを生成しないといけないよう
  - ということで、これ以後調査していない
  - マニュアル https://developers.google.com/custom-search/docs/snippets


## 検索結果のハイライト

bタグを付与してくれているので、それをCSSで修正する


## 検索順位（順序？）

- sorty_by 属性を設定するとできるらしい、デフォルトは "Relevance"(妥当順？)
- その他、デフォルトで設定可能なのは Date 順のみ
  - この設定は、コンパネ＞検索機能＞詳細設定＞検索結果の並び替え からできる
- ただし、それ以外の項目でソートさせたい場合は、こちらで何かを出力して API 側に知らせる必要があるらしい
  - ここで一旦調査は保留にしている
  - マニュアル Sort results https://support.google.com/customsearch/answer/2549537
