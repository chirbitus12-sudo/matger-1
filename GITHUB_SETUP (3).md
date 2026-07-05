# 🚀 دليل رفع المشروع على GitHub

دليل شامل خطوة بخطوة لرفع **متجر الملف** على GitHub.

## 📋 المتطلبات الأساسية

قبل البدء، تأكد من:

- ✅ لديك حساب على [GitHub](https://github.com) (مجاني)
- ✅ Git مُثبّت على جهازك (`git --version`)
- ✅ حزمة المشروع `matjar-almailf-v1.0.0.tar.gz` أو `.zip`
- ✅ محرر كود (VS Code يُفضّل)

## 📥 الطريقة 1: رفع الحزمة الجاهزة (الأسهل)

### 1️⃣ فك ضغط الحزمة

```bash
# Linux/macOS
tar -xzf matjar-almailf-v1.0.0.tar.gz -C matjar-almailf
cd matjar-almailf

# أو لملف zip
unzip matjar-almailf-v1.0.0.zip -d matjar-almailf
cd matjar-almailf
```

### 2️⃣ تهيئة Git محلياً

```bash
# تهيئة Git
git init

# إضافة جميع الملفات
git add .

# أول commit
git commit -m "🎉 Initial commit: متجر الملف v1.0.0"

# تغيير اسم الفرع إلى main
git branch -M main
```

### 3️⃣ إنشاء مستودع على GitHub

1. اذهب إلى **[github.com/new](https://github.com/new)**
2. املأ التفاصيل:
   - **Repository name**: `matjar-almailf`
   - **Description**: `متجر منتجات رقمية احترافي بالعربية مع دفع CCP ولوحة تحكم`
   - **Visibility**: اختر **Private** (يُفضّل) أو **Public**
   - **لا تختر**: "Add a README" أو "Add .gitignore" أو "Choose a license"
3. اضغط **Create repository**

### 4️⃣ ربط المشروع ورفعه

انسخ الأوامر من GitHub (أو استبدل `USERNAME` باسم مستخدمك):

```bash
# إضافة الـ remote
git remote add origin https://github.com/USERNAME/matjar-almailf.git

# رفع المشروع
git push -u origin main
```

**سيطلب منك GitHub:**
- **Username**: اسم مستخدم GitHub
- **Password**: استخدم [Personal Access Token](https://github.com/settings/tokens) (وليس كلمة المرور العادية)

### 5️⃣ الحصول على Personal Access Token

1. اذهب إلى **GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)**
2. اضغط **Generate new token (classic)**
3. املأ:
   - **Note**: `matjar-almailf-push`
   - **Expiration**: `90 days` (أو حسب اختيارك)
   - **Scopes**: اختر `repo` (كامل)
4. اضغط **Generate token**
5. **انسخ الـ token** (لن تتمكن من رؤيته مرة أخرى!)
6. استخدمه كـ Password عند الـ push

## 🛠️ الطريقة 2: استخدام GitHub CLI (الأسرع)

### 1️⃣ تثبيت GitHub CLI

```bash
# Linux (Ubuntu/Debian)
sudo apt install gh

# macOS
brew install gh

# Windows
winget install GitHub.cli
```

### 2️⃣ تسجيل الدخول

```bash
gh auth login
```
اتبع التعليمات التفاعلية.

### 3️⃣ إنشاء المستودع ورفع المشروع

```bash
cd matjar-almailf
gh repo create matjar-almailf --private --source=. --push
```

## 📤 الطريقة 3: الرفع المباشر عبر GitHub Web

إذا لم تكن مرتاحاً مع سطر الأوامر:

1. أنشئ مستودعاً جديداً على GitHub (بدون README/gitignore/license)
2. افتح الصفحة الرئيسية للمستودع الجديد
3. اضغط **uploading an existing file**
4. اسحب وأفلت جميع ملفات المشروع (وليس المجلدات)
5. اكتب commit message: `🎉 Initial commit`
6. اضغط **Commit changes**

⚠️ **عيوب هذه الطريقة:**
- لا تُحافظ على بنية المجلدات بشكل مثالي
- لا ترفع الملفات المخفية (.env.example, .gitignore, إلخ)

## ✅ التحقق من نجاح الرفع

بعد الرفع، تحقق من:

### 1. صفحة المستودع
- اذهب إلى `https://github.com/USERNAME/matjar-almailf`
- يجب أن ترى جميع الملفات
- يجب أن يظهر README.md بشكل جميل

### 2. عدم وجود ملفات حساسة
```bash
# تحقق من عدم وجود ملف .env
git ls-files | grep -E "\.env$"
# يجب أن يُرجع: لا شيء

# تحقق من عدم وجود قاعدة البيانات
git ls-files | grep "custom.db"
# يجب أن يُرجع: لا شيء
```

### 3. تفعيل GitHub Actions
- اذهب إلى تبويب **Actions** في المستودع
- يجب أن ترى workflow `CI` يعمل عند كل push

## 🔐 إعداد Secrets للـ CI/CD (اختياري)

لجعل GitHub Actions يعمل بشكل كامل:

1. اذهب إلى **Settings → Secrets and variables → Actions**
2. اضغط **New repository secret**
3. أضف المتغيرات التالية:

| الاسم | القيمة |
|------|--------|
| `DATABASE_URL` | `file:./db/test.db` |
| `JWT_SECRET` | قيمة عشوائية طويلة |
| `ADMIN_EMAIL` | `test@test.com` |
| `ADMIN_PASSWORD` | `test-password` |
| `NEXT_PUBLIC_SITE_URL` | `http://localhost:3000` |
| `CCP_ACCOUNT_NUMBER` | `00000000` |
| `CCP_KEY` | `00` |
| `NEXT_PUBLIC_CCP_ACCOUNT_NUMBER` | `00000000` |
| `NEXT_PUBLIC_CCP_KEY` | `00` |

## 🚀 النشر على Vercel بعد الرفع على GitHub

1. اذهب إلى **[vercel.com](https://vercel.com)** وسجّل بالحساب نفسه على GitHub
2. اضغط **Add New Project**
3. اختر مستودع `matjar-almailf`
4. أضف متغيرات البيئة في **Environment Variables**
5. اضغط **Deploy**

## 🆘 استكشاف الأخطاء

### خطأ: `Permission denied (publickey)`
**الحل**: استخدم HTTPS بدلاً من SSH
```bash
git remote set-url origin https://github.com/USERNAME/matjar-almailf.git
```

### خطأ: `fatal: refusing to merge unrelated histories`
**الحل**: اسمح بدمج التواريخ
```bash
git pull origin main --allow-unrelated-histories
git push -u origin main
```

### خطأ: `Authentication failed`
**الحل**: استخدم Personal Access Token بدلاً من كلمة المرور
- اذهب إلى GitHub → Settings → Developer settings → Personal access tokens
- أنشئ token جديد بصلاحية `repo`
- استخدمه عند الـ push

### خطأ: `Repository not found`
**الحل**: تأكد من:
- اسم المستخدم صحيح
- المستودع موجود
- لديك صلاحية الوصول (للمستودعات الخاصة)

## 📞 الدعم

إذا واجهت أي مشكلة:
- 📧 البريد: fartougarso@gmail.com
- 🐛 [Issues](https://github.com/fartougarso/matjar-almailf/issues)

---

<div align="center">

**🎉 رائع! مشروعك الآن على GitHub!**

</div>
