# socloud 自动签到脚本

## 使用说明

帮助你在 socloud.me 签到领流量

### 直接运行

```sh
./auto_checkin.sh <email> <password>
```

### 定时运行

使用 crontab 设置每天 2:54 运行

```
crontab -e
```

打开的文件中新增一行 task

```
54 2  * * * /path/to/socloud-auto-check/auto_checkin.sh email password > /path/to/socloud-auto-check/socloud-checkin.log
```

## 请求

endpoint: /auth/login

```sh
curl 'https://socloud.me/auth/login' \
 -H 'accept: application/json, text/javascript, _/_; q=0.01' \
 -H 'accept-language: en,zh-CN;q=0.9,zh;q=0.8,en-GB;q=0.7,en-US;q=0.6,zh-TW;q=0.5' \
 -H 'content-type: application/x-www-form-urlencoded; charset=UTF-8' \
 -H 'origin: https://socloud.me' \
 -H 'priority: u=1, i' \
 -H 'referer: https://socloud.me/auth/login' \
 --data-raw 'email=foo%40gmail.com&passwd=123456&code='
```

### 响应

< HTTP/2 200
< date: Wed, 19 Mar 2025 17:40:46 GMT
< content-type: text/html; charset=UTF-8
< set-cookie: uid=136629; expires=Thu, 20-Mar-2025 17:40:46 GMT; Max-Age=86400; path=/
< set-cookie: email=zhuyifei341%40gmail.com; expires=Thu, 20-Mar-2025 17:40:46 GMT; Max-Age=86400; path=/
< set-cookie: key=29ad444989d44ab065785eca4c51150cbfc4002de5848; expires=Thu, 20-Mar-2025 17:40:46 GMT; Max-Age=86400; path=/
< set-cookie: ip=fd909afcf327b06e4c8852dec895af0c; expires=Thu, 20-Mar-2025 17:40:46 GMT; Max-Age=86400; path=/
< set-cookie: expire_in=1742492446; expires=Thu, 20-Mar-2025 17:40:46 GMT; Max-Age=86400; path=/
< access-control-allow-origin: https://getgoso.net
< strict-transport-security: max-age=31536000; includeSubDomains; preload
< cf-cache-status: DYNAMIC
< report-to: {"endpoints":[{"url":"https:\/\/a.nel.cloudflare.com\/report\/v4?s=PttJhigo2nYQpLCvUlmUjo7FXIPH1Hq5AKOJz2VcQudp%2Ba4eBONE98Ps4M3xQAYDyNZyt5UudSzBP52yOLXQyuYTjAfRIesFDp077m5xj5VIy2Rv%2FC1FqD9cMxr5"}],"group":"cf-nel","max_age":604800}
< nel: {"success_fraction":0,"report_to":"cf-nel","max_age":604800}
< server: cloudflare
< cf-ray: 922ec1bfc89c1749-SJC
< alt-svc: h3=":443"; ma=86400
< server-timing: cfL4;desc="?proto=TCP&rtt=6486&min_rtt=1076&rtt_var=10805&sent=6&recv=9&lost=0&retrans=0&sent_bytes=2910&recv_bytes=1056&delivery_rate=2683966&cwnd=248&unsent_bytes=0&cid=3f2b6cfabb1002bc&ts=771&x=0"
<

## 签到

endpoint: /user/checkin

```sh
curl 'https://socloud.me/user/checkin' \
 -X 'POST' \
 -H 'accept: application/json, text/javascript, _/_; q=0.01' \
 -H 'accept-language: en,zh-CN;q=0.9,zh;q=0.8,en-GB;q=0.7,en-US;q=0.6,zh-TW;q=0.5' \
 -H 'content-length: 0' \
 -b 'PHPSESSID=848bb24f0b63aee861cc5f9399938a86; uid=123; email=foo%40gmail.com; key=07a63df4ba727b85906ddd6c88d7d302027116eb4a488; ip=3310e3054646beee7d9e448e27ea7c37; expire_in=1742580819; crisp-client%2Fsession%2F233710e4-9a5f-4b81-be1e-a1cb6fe17a62=session_4025887f-0e09-4324-800f-fe02ee92a44d' \
 -H 'origin: https://socloud.me' \
 -H 'priority: u=1, i' \
 -H 'referer: https://socloud.me/user' \
 -H 'x-requested-with: XMLHttpRequest'

```
