# コピー元：https://gist.github.com/yasny/8893315
# 参考：<http://qiita.com/PSP_T/items/b785ec0c30eb8e386680>
function google
  set -l opt
  set -l str

  if [ -n "$argv" ]
    for o in $argv
      set str "$str+$o"
    end

    set str (echo $str | sed 's/^\+//')
    set opt "search?num=50&hl=ja&q=$str"
  end
  w3m "http://www.google.com/$opt"
end
