# md2html
prepare for website convert

* 安装

```
npm install -g marked
npm install
```

* 批量执行

```
npm run product
```

* 分步执行

```
# 编译基本doc -> html
sh bin/mark.sh

# 增加sumarry
sh bin/data.sh

# 增加header,footer
node index.js

```

