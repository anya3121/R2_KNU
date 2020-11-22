```
library("rvest")
Url<-("http://www.imdb.com/search/title?count=100&release_date=2017,2017&title_type=feature")
movies<-read_html(Url)
movies
```
```
{html_document}
<html xmlns:og="http://ogp.me/ns#" xmlns:fb="http://www.facebook.com/2008/fbml">
[1] <head>\n<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n<script type="text/javascript">var ue_t0 ...
[2] <body id="styleguide-v2" class="fixed">\n            <img height="1" width="1" style="display:none;visibility:hidden; ...
```
