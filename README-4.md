# Nova-Proxy Wizard -- Go Edition

A clean Go-based wizard for deploying [Nova-Proxy](https://github.com/IRNova/Nova-Proxy) on Cloudflare Workers.

**No Wrangler. No Node.js. Pure Cloudflare API. Works on Android/Termux.**

---

## Features

- Install Nova-Proxy on one or multiple Cloudflare accounts simultaneously
- Auto-generated random 32-character worker names
- KV Namespace created and bound automatically
- Update any deployed worker
- View status of all deployed workers
- Uninstall any worker with confirmation
- Exports deployed URLs as `.txt` and `.json`

---

## Quick Install

### Linux / macOS / Android (Termux)

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/amzolghadr/nova-wizard/main/install.sh)
```

Then run:

```bash
nova-wizard
```

### Windows

Download the latest `.exe` from [Releases](https://github.com/amzolghadr/nova-wizard/releases/latest) and run it.

---

## Multi-Account Deployment

Nova-Proxy Wizard supports deploying to multiple Cloudflare accounts at once using a single API token.

### Step 1 -- Create an API Token

1. Go to [dash.cloudflare.com/profile/api-tokens](https://dash.cloudflare.com/profile/api-tokens)
2. Click **Create Token**
3. Use the **Edit Cloudflare Workers** template
4. Add permission: **Workers KV Storage -- Edit**
5. Under **Account Resources**, set to **All accounts**
6. Click **Continue to summary**, then **Create Token**
7. Copy the token

### Step 2 -- Run the wizard

```bash
nova-wizard
```

Select **6) Set API Token**, paste your token.

Then select **1) Install**.

The wizard will list all your accounts:

```
[+] Found 3 account(s):

   1) My Main Account   (abc12345...)
   2) Business Account  (def67890...)
   3) Dev Account       (ghi11121...)

[?] Enter numbers to deploy to (e.g: 1,3) or 'all':
 > all
```

### Step 3 -- Access your panel

After deployment:

```
[+] Panel URL: https://WORKER.SUBDOMAIN.workers.dev/Nova-Proxy/admin
[i] Password : admin
```

Change your password immediately after first login.

---

## Requirements

- A [Cloudflare](https://cloudflare.com) account (free tier works)
- An API Token with **Workers** and **KV Storage** permissions

---

## Build from source

```bash
git clone https://github.com/amzolghadr/nova-wizard
cd nova-wizard
go build -o nova-wizard .
./nova-wizard
```

---

---

# ویزارد Nova-Proxy -- نسخه Go

ابزاری برای نصب و مدیریت [Nova-Proxy](https://github.com/IRNova/Nova-Proxy) روی Cloudflare Workers.

**بدون Wrangler. بدون Node.js. فقط Cloudflare API. روی اندروید/Termux هم کار می‌کنه.**

---

## امکانات

- نصب Nova-Proxy روی یک یا چند اکانت Cloudflare به صورت همزمان
- نام Worker کاملاً رندوم و ۳۲ حرفی
- ساخت و bind خودکار KV Namespace
- آپدیت هر Worker به آخرین نسخه
- مشاهده وضعیت تمام Worker های نصب‌شده
- حذف هر Worker با تأیید دوگانه
- ذخیره خروجی URL ها به صورت `.txt` و `.json`

---

## نصب سریع

### لینوکس / مک / اندروید (Termux)

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/amzolghadr/nova-wizard/main/install.sh)
```

بعد اجرا کن:

```bash
nova-wizard
```

---

## نصب روی چند اکانت به صورت همزمان

### مرحله ۱ -- ساخت API Token

1. برو به [dash.cloudflare.com/profile/api-tokens](https://dash.cloudflare.com/profile/api-tokens)
2. روی **Create Token** کلیک کن
3. تمپلت **Edit Cloudflare Workers** رو انتخاب کن
4. دسترسی **Workers KV Storage -- Edit** رو اضافه کن
5. در بخش **Account Resources** گزینه **All accounts** رو انتخاب کن
6. روی **Continue to summary** و بعد **Create Token** کلیک کن
7. توکن رو کپی کن

### مرحله ۲ -- اجرای ویزارد

```bash
nova-wizard
```

گزینه **6) Set API Token** رو بزن و توکن رو paste کن.

بعد گزینه **1) Install** رو انتخاب کن:

```
[+] Found 3 account(s):

   1) اکانت اصلی      (abc12345...)
   2) اکانت تجاری     (def67890...)
   3) اکانت توسعه     (ghi11121...)

[?] Enter numbers to deploy to (e.g: 1,3) or 'all':
 > all
```

### مرحله ۳ -- دسترسی به پنل

بعد از نصب:

```
[+] Panel URL: https://WORKER.SUBDOMAIN.workers.dev/Nova-Proxy/admin
[i] Password : admin
```

بلافاصله بعد از اولین ورود رمز رو تغییر بده.

---

## نیازمندی‌ها

- اکانت [Cloudflare](https://cloudflare.com) (پلن رایگان کافیه)
- API Token با دسترسی Workers و KV Storage
